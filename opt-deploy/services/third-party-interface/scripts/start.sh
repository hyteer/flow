#!/bin/bash

BASE="/data"
WEB_PATH="/data/www"
PHP="/usr/local/bin/php"
CONSUL="/usr/local/sbin/consul"
WAIT="/scripts/wait-for-it.sh"
SRV_NAME="third-party-interface"

echo "启动服务..."
function start_service () {
	# service-base
	echo "启动service-${SRV_NAME}..."
	cd ${WEB_PATH}/service-${SRV_NAME}
	${PHP} start.php start -d
	${PHP} start.php status

}

start_service
