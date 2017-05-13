#!/bin/bash
echo "开始部署......"
BASE="/data"

cd ${BASE}
pwd
ls

function deploy_gateway_go() {
    echo "==部署Go网关=="
    cd ${BASE}/go
    chmod +x go_gateway *.sh gateway.json
    sed -i 's/"127.0.0.1:8500"/"consul:8500"/g' gateway.json
    sed -i 's/10.100.100.112/10.20.60.9/g' gateway.json
    sed -i 's/10.100.100.70/10.20.60.3/g' gateway.json
    cd /data
}

deploy_gateway_go





