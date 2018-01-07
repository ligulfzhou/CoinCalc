package main

import (
	"fmt"
	"log"

	pb "CoinCalc/proto"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const (
	address = "localhost:50005"
)

func main() {

	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatal("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewCoinCalcClient(conn)

	req := &pb.CoinListRequest{Page: 1}
	r, err := c.GetCoins(context.Background(), req)
	for idx, coin := range r.Coins {
		fmt.Println("idx: coin: ", idx, coin.Id)
	}
}
