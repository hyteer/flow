#!/bin/bash

BASE="/data"
WEB_PATH="/data/www"
PHP="/usr/local/bin/php"
WAIT="/scripts/tools/wait-for-it.sh"
SRV_NAME="service-third-party-interface"

echo "启动服务..."
function start_service () {
	# service-base
	echo "启动${SRV_NAME}..."
	cd ${WEB_PATH}/${SRV_NAME}
	php start.php start -d
	php start.php status

}

start_service
