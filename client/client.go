package main

import (
	"flag"
	"fmt"
	"log"

	pb "CoinCalc/proto"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

//const (
//	address = "localhost:50005"
//)

func main() {
	port := flag.String("port", "5000", "port num")
	flag.Parse()

	conn, err := grpc.Dial("127.0.0.1:"+*port, grpc.WithInsecure())
	if err != nil {
		log.Fatal("did not connect: %v", err)
	}
	defer conn.Close()
	c := pb.NewCoinCalcClient(conn)

	req := &pb.CoinListRequest{Page: 2}
	r, err := c.GetCoins(context.Background(), req)
	for idx, coin := range r.Coins {
		fmt.Println("idx: coin: ", idx, coin)
	}

	symbols := []string{"BTC", "ETH"}
	req2 := &pb.PriceRequest{Symbols: symbols}
	r2, _ := c.GetCoinPrices(context.Background(), req2)
	for idx, coin2 := range r2.Coins {
		fmt.Println("idx: coin: ", idx, coin2)
	}

	req3 := &pb.GetUserCoinRequest{User: "2FE957DF-8017-4E10-8F1B-D69E1A2BD032"}
	r3, _ := c.GetUserCoins(context.Background(), req3)
	for idx, coin3 := range r3.Ucs {
		fmt.Println("idx: coin: ", idx, coin3.Coin)
	}

	searchReq := &pb.SearchCoinRequest{Name: "B"}
	r4, _ := c.SearchCoin(context.Background(), searchReq)
	fmt.Print(r4)

	for idx, coin4 := range r4.Coins {
		fmt.Print("idx: coin:", idx, coin4)
	}
}
