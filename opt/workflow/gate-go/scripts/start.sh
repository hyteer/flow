#!/bin/bash
BASE="/data"
GO_PATH="${BASE}/go"

function start_gateway_go() {
    echo "==启动Go网关=="
    cd ${GO_PATH}
    chmod +x go_gateway *.sh *.json
    sleep 1
    ${GO_PATH}/go_gateway -D -config_file gateway.json
    #nohup /data/go_gateway/go_gateway -config_file gateway.json &
    cd ${BASE}
}

start_gateway_go
