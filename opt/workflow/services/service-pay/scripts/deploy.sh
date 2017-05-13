#!/bin/bash
BASE="/data"
WEB_PATH="${BASE}/www"
PHP="/usr/local/bin/php"
REDIS="10.20.60.3"
SRV_NAME="service-third-party"
SRV_DIR="${WEB_PATH}/${SRV_NAME}"

function deploy_service() {
    echo "==开始部署${SRV_NAME}=="
    cd ${SRV_DIR}
    echo "===生成thrift codes..."
    /bin/bash thrift-gen.sh
    echo "生成结果..."
    ls thriftServices
    echo "===Init..."
    php init --env=Test --overwrite=All
    sed -i "s/'hostname' => '10.100.100.70'/'hostname' => '${REDIS}'/g" config/main-local.php
    sed -i 's/mysql:host=10.100.100.71;/mysql:host=10.20.60.3;/g' config/main-local.php
    sed -i "s/'username' => 'prime_wechat_if',/'username' => 'root',/g" config/main-local.php
    sed -i "s/'password' => 'LHHeB62GRUXUfE3i',/'password' => '111',/g" config/main-local.php
    cd runtime && mkdir -p debug info logs
}

deploy_service
cd ${SRV_DIR}
echo "部署完成..."
