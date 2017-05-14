#!/bin/bash
MANAGER="consul"
NET_NAME="opt-net"
#WAIT="./scripts/wait-for-it.sh"


echo "start..."


function up () {
        echo "创建网络..."
        docker network create -d overlay ${NET_NAME}
        echo "启动gate-go网关..."
        docker service create --network ${NET_NAME} --name gate-go 10.100.100.130:5000/opt/gate-go
        echo "启动consul网关..."
        docker service create --network ${NET_NAME} --name consul 10.100.100.130:5000/opt/consul

        echo "启动gate-gateway-app-merchant网关..."
        docker service create --network ${NET_NAME} --name gateway-app-merchant 10.100.100.130:5000/opt/gateway-app-merchant:ci
        echo "启动gate-gateway-app-salesman网关..."
        docker service create --network ${NET_NAME} --name gateway-app-salesman 10.100.100.130:5000/opt/gateway-app-salesman
        #echo "启动gate-merc网关..."
        #docker service create --network ${NET_NAME} --name gate-merc 10.100.100.130:5000/opt/gate-merc

        echo "启动Base服务..."
        docker service create --network ${NET_NAME} --name Base 10.100.100.130:5000/opt/service-base:ci
        echo "启动gate-qrcode..."
        docker service create --network ${NET_NAME} --name Qrcode 10.100.100.130:5000/opt/service-qrcode:ci
        echo "启动gate-pay..."
        docker service create --network ${NET_NAME} --name Pay 10.100.100.130:5000/opt/service-pay:ci
        echo "启动gate-product..."
        docker service create --network ${NET_NAME} --name Product 10.100.100.130:5000/opt/service-product:ci
        echo "启动service-shop..."
        docker service create --network ${NET_NAME} --name Shop 10.100.100.130:5000/opt/service-shop:ci
        docker service create --network ${NET_NAME} --name Message 10.100.100.130:5000/opt/service-shop:ci
        echo "启动gate-user..."
        docker service create --network ${NET_NAME} --name Users 10.100.100.130:5000/opt/service-user:ci
        echo "启动gate-third-party..."
        docker service create --network ${NET_NAME} --name ThirdParty 10.100.100.130:5000/opt/service-third-party:ci
        echo "启动gate-third-party-interface..."
        docker service create --network ${NET_NAME} --name ThirdPartyInterface 10.100.100.130:5000/opt/service-third-party-interface:ci

        echo "启动nginx服务..."
        sleep 3

        docker service create --network ${NET_NAME} --name nginx -p 80:80 10.100.100.130:5000/opt/nginx

        echo "启动完成..."

}


function down () {
        echo "删除服务..."

        docker service rm Base
        docker service rm Qrcode
        docker service rm Pay
        docker service rm Product
        docker service rm Shop
        docker service rm Message
        docker service rm Users
        docker service rm ThirdParty
        docker service rm ThirdPartyInterface

        docker service rm nginx
        docker service rm gate-go
        docker service rm consul
        docker service rm gateway-app-merchant
        docker service rm gateway-app-salesman
        #docker service rm gate-merc

        #echo "删除网络..."
        #docker network rm ${NET_NAME}
        #echo "已删除..."
}

function ps () {
        echo "Swarm Services..."
        docker service ps gate-go
        docker service ps nginx
        docker service ps consul
        docker service ps Base
        docker service ps Qrcode
        docker service ps Pay
}

# Entryppint
function main() {
    Command=$1
    shift
    case "${Command}" in
        up)         up ;;
        down)       down ;;
        ps)         ps ;;
        #nodes)      list_nodes ;;
        *)          echo "Usage: $0 <up|down|ps"; exit 1 ;;
    esac
}

main "$@"
