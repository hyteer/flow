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
    cd /data
}

deploy_gateway_go





