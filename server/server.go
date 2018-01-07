package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net"
	//"reflect"

	pb "CoinCalc/proto"
	"github.com/garyburd/redigo/redis"
	///"github.com/golang/protobuf/jsonpb"
	//"github.com/golang/protobuf/proto"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

const (
	port = ":50005"
)

type server struct{}

func (s *server) GetRedisCon() (redis.Conn, error) {
	c, err := redis.Dial("tcp", "127.0.0.1:6379")

	if err != nil {
		fmt.Println("connect to redis error", err)
	}

	// defer c.Close()
	return c, nil
}

func (s *server) GetCoins(ctx context.Context, in *pb.CoinListRequest) (*pb.CoinListResponse, error) {

	c, err := s.GetRedisCon()
	if err != nil {
		fmt.Println("error", err)
	}
	defer c.Close()

	start, limit := (in.Page-1)*100, 100
	res, _ := redis.Strings(c.Do("lrange", "coins", start, limit))
	fmt.Println(res)

	coinKeys := []interface{}{}
	for _, coinid := range res {
		coinKeys = append(coinKeys, "coin_"+coinid)
	}

	coinsr, _ := redis.Strings(c.Do("mget", coinKeys...))

	coins := []*pb.Coin{}
	for _, coin := range coinsr {
		tmp := pb.Coin{}
		_ = json.Unmarshal(([]byte)(coin), &tmp)
		fmt.Println("coinid: ", tmp.Id)
		coins = append(coins, &tmp)
	}

	return &pb.CoinListResponse{
		Coins: coins,
	}, nil
}

func (s *server) GetCoinPrices(ctx context.Context, in *pb.PriceRequest) (*pb.CoinPriceResponse, error) {

	c, err := s.GetRedisCon()
	if err != nil {
		fmt.Println("error, ", err)
	}
	defer c.Close()

	coins := []*pb.Coin{}
	return &pb.CoinPriceResponse{
		Coins: coins,
	}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	pb.RegisterCoinCalcServer(s, &server{})
	// Register reflection service on gRPC server.
	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}