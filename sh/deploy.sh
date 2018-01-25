upload() {
cd /Users/zhouligang/go/src/CoinCalc/server
rm server

env GOOS=linux GOARCH=amd64 go build -v CoinCalc/server

ssh aws <<EOF
cd /home/ubuntu/source/go_coincalc
rm server
EOF

scp server aws:/home/ubuntu/source/go_coincalc/
}

restart() {
ssh aws << EOF
svc restart coincalc:coincalc-8800
svc restart coincalc:coincalc-8801
svc restart coincalc:coincalc-8802
svc restart coincalc:coincalc-8803
EOF
}

if [ $1 = "restart" ] ; then
    echo "restart"
    restart
else
    echo "deploy"
    upload
    restart
fi
