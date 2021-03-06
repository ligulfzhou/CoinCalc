package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"net"
	"strings"

	pb "CoinCalc/proto"
	"CoinCalc/server/db"
	"github.com/garyburd/redigo/redis"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct{}

func (s *server) GetRedisCon() (redis.Conn, error) {
	c, err := redis.Dial("tcp", "127.0.0.1:6379")

	if err != nil {
		fmt.Println("connect to redis error", err)
	}

	return c, nil
}

func (s *server) GetDBInstance() database.DB {
	db := database.DB{}
	return db
}

func (s *server) GetCoins(ctx context.Context, in *pb.CoinListRequest) (*pb.CoinListResponse, error) {
	fmt.Println("Call GetCoins")

	c, _ := s.GetRedisCon()
	defer c.Close()

	start, limit := (in.Page-1)*100, int32(99)
	fmt.Println(start, limit)
	res, _ := redis.Strings(c.Do("lrange", "coins", start, start+limit))

	coinKeys := []interface{}{}
	for _, coinSymbolAndName := range res {
		coinKeys = append(coinKeys, "coin_"+coinSymbolAndName)
	}

	coinsr, _ := redis.Strings(c.Do("mget", coinKeys...))

	coins := []*pb.Coin{}
	for _, coin := range coinsr {
		tmp := pb.Coin{}
		_ = json.Unmarshal(([]byte)(coin), &tmp)
		coins = append(coins, &tmp)
	}

	return &pb.CoinListResponse{
		Coins: coins,
	}, nil
}

func (s *server) GetCoinPrices(ctx context.Context, in *pb.PriceRequest) (*pb.CoinPriceResponse, error) {
	fmt.Println("Call GetCoinPrices")

	c, _ := s.GetRedisCon()
	defer c.Close()

	symbols := in.Symbols

	keys := []interface{}{}
	for _, symbol := range symbols {
		keys = append(keys, "coin_"+symbol)
	}

	coinsr, _ := redis.Strings(c.Do("mget", keys...))

	coins := []*pb.Coin{}
	for _, coin := range coinsr {
		tmp := pb.Coin{}
		_ = json.Unmarshal(([]byte)(coin), &tmp)
		coins = append(coins, &tmp)
	}

	return &pb.CoinPriceResponse{
		Coins: coins,
	}, nil
}

func (s *server) SetUserCoin(ctx context.Context, in *pb.SetUserCoinRequest) (*pb.SetUserCoinResponse, error) {
	fmt.Println("Call SetUserCoin, params: ", in.Uc.User)
	db := s.GetDBInstance()

	uc := db.SetUserCoin(in.Uc.User, in.Uc.Symbol, in.Uc.Name, in.Uc.Cnt)
	fmt.Println("uc, ", uc)

	c, _ := s.GetRedisCon()
	defer c.Close()

	coins, _ := redis.String(c.Do("get", "coin_"+uc.Symbol+"_"+uc.Name))
	coin := &pb.Coin{}
	//_ := json.Unmarshal(coins, &coin)
	json.Unmarshal(([]byte)(coins), &coin)

	resUc := &pb.UserCoin{User: uc.User, Symbol: uc.Symbol, Cnt: uc.Cnt, Coin: coin}
	return &pb.SetUserCoinResponse{Uc: resUc}, nil
}

func (s *server) GetUserCoins(ctx context.Context, in *pb.GetUserCoinRequest) (*pb.GetUserCoinsResponse, error) {
	fmt.Println("Call GetUserCoins, params", in.User)
	db := s.GetDBInstance()

	userCoins := db.GetUserCoins(in.User)
	keys := []interface{}{}
	for _, t := range userCoins {
		keys = append(keys, "coin_"+t.Symbol+"_"+t.Name)
	}

	c, _ := s.GetRedisCon()
	coinsr, _ := redis.Strings(c.Do("mget", keys...))
	symbolCoinMap := make(map[string]*pb.Coin)
	for _, coin := range coinsr {
		tmp := pb.Coin{}
		_ = json.Unmarshal(([]byte)(coin), &tmp)
		fmt.Println("symbol: ", tmp.Symbol)
		symbolCoinMap[tmp.Symbol] = &tmp
	}

	ucs := []*pb.UserCoin{}
	for _, coin := range userCoins {
		uc := &pb.UserCoin{User: coin.User, Name: coin.Name, Symbol: coin.Symbol, Cnt: coin.Cnt, Coin: symbolCoinMap[coin.Symbol]}
		ucs = append(ucs, uc)
	}
	return &pb.GetUserCoinsResponse{Ucs: ucs}, nil
}

func (s *server) DeleteUserCoin(ctx context.Context, in *pb.DeleteUserCoinRequest) (*pb.Empty, error) {
	fmt.Println("call DeleteUserCoin, params", in.User, in.Symbol, in.Name)
	user, symbol, name := in.User, in.Symbol, in.Name

	db := s.GetDBInstance()
	db.DeleteUserCoin(user, symbol, name)

	return &pb.Empty{}, nil
}

func (s *server) SearchCoin(ctx context.Context, in *pb.SearchCoinRequest) (*pb.CoinListResponse, error) {
	fmt.Println("call SearchCoin, params", in.Name)

	coinsR := []*pb.Coin{}
	if strings.TrimSpace(in.Name) == "" {
		return &pb.CoinListResponse{
			Coins: coinsR,
		}, nil
	}
	db := s.GetDBInstance()

	coins := db.SearchCoin(in.Name)
	if len(coins) <= 0 {
		return &pb.CoinListResponse{
			Coins: coinsR,
		}, nil
	}

	coinKeys := []interface{}{}
	for _, coin := range coins {
		coinKeys = append(coinKeys, "coin_"+coin.Symbol+"_"+coin.Name)
	}

	c, _ := s.GetRedisCon()
	defer c.Close()

	coinsr, _ := redis.Strings(c.Do("mget", coinKeys...))
	for _, coin := range coinsr {
		tmp := pb.Coin{}
		_ = json.Unmarshal(([]byte)(coin), &tmp)
		coinsR = append(coinsR, &tmp)
	}

	return &pb.CoinListResponse{
		Coins: coinsR,
	}, nil
}

func main() {
	port := flag.String("port", "50005", "run on which port")
	flag.Parse()

	fmt.Println("run on port", *port)
	lis, err := net.Listen("tcp", "127.0.0.1:"+*port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	pb.RegisterCoinCalcServer(s, &server{})
	reflection.Register(s)
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
