# cd /Users/zhouligang/go/src/CoinCalc/server
# rm server
# 
# env GOOS=linux GOARCH=amd64 go build -v CoinCalc/server
# 
# scp server aws:/home/ubuntu/source/go_coincalc/server.bk
ssh aws << EOF
#cd /home/ubuntu/source/go_coincalc
#rm server
#mv server.bk server

for i in `8801...8803`
do
svc restart coincalc:coincalc-$$i
done

EOF
