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
		fmt.Println("idx: coin: ", idx, coin.Symbol)
	}

	symbols := []string{"BTC", "ETH"}
	req2 := &pb.PriceRequest{Symbols: symbols}
	r2, _ := c.GetCoinPrices(context.Background(), req2)
	for idx, coin2 := range r2.Coins {
		fmt.Println("idx: coin: ", idx, coin2.Symbol)
	}

	req3 := &pb.GetUserCoinRequest{User: "zhouligang"}
	r3, _ := c.GetUserCoins(context.Background(), req3)
	for idx, coin3 := range r3.Ucs {
		fmt.Println("idx: coin: ", idx, coin3.Symbol)
	}
}
