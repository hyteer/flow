#!/bin/bash
echo "开始部署服务......"
BASE="/data"
WEB_PATH="${BASE}/www"
PHP="/usr/local/bin/php"
REDIS="10.20.60.3"
SRV_NAME="third-party-interface"


function deploy_service() {
    echo "==部署service-${SRV_NAME}=="
    cd ${WEB_PATH}/service-${SRV_NAME}
    php init --env=Test --overwrite=All
    sed -i "s/'hostname' => '10.100.100.70'/'hostname' => '${REDIS}'/g" config/main-local.php
    sed -i 's/mysql:host=10.100.100.71;/mysql:host=10.20.60.3;/g' config/main-local.php
    sed -i "s/'username' => 'prime_wechat_if',/'username' => 'root',/g" config/main-local.php
    sed -i "s/'password' => 'LHHeB62GRUXUfE3i',/'password' => '111',/g" config/main-local.php
    mkdir -p ./runtime/debug ./runtime/info
}

deploy_service

echo "部署完成..."
