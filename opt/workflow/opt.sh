#!/bin/bash
MANAGER="consul"
NET_NAME="opt-net"

#WAIT="./scripts/wait-for-it.sh"
services=(
		Base
		Qrcode
		Pay
		Product
		Shop
		Message
		Users
		ThirdParty
		ThirdPartyInterface
)


echo "start..."


function up () {
	#echo "创建网络..."
	#docker network create -d overlay ${NET_NAME}
	echo "启动服务..."
	for srv in ${services[@]}
	do
		docker service create --network ${NET_NAME} --name  ${srv} 10.100.100.130:5000/opt/service-base:ci
		docker service rm ${srv}
	done
	#echo "启动nginx服务..."
	#sleep 3
	#docker service create --network ${NET_NAME} --name nginx -p 80:80 10.100.100.130:5000/opt/nginx

	echo "启动完成..."

}

function down () {
	echo "删除服务..."

	for srv in ${services[@]}
	do
		docker service rm ${srv}
	done
	#docker service rm nginx
	#docker service rm gate-go
	#docker service rm consul
	#docker service rm gate-appdt
	#docker service rm gate-appmc
	#docker service rm gate-merc

	#echo "删除网络..."
	#docker network rm ${NET_NAME}
	echo "服务已删除..."
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
