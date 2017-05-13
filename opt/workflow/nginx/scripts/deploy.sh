#!/bin/bash
echo "Start to deploy..."
BASE="/data"
WEB_PATH="${BASE}/www"
NGINX_PATH="/etc/nginx"

mv /scripts/tools /tools
cd ${WEB_PATH}

make_soft_link () {
    echo "建立域名映射软链接..."
    cd ${WEB_PATH}
    ln -s frontend-h5-rest-shop \*.testmopt.snsshop.net
}

nginx_conf () {
    echo "配置nginx..."
   
}

make_soft_link

echo "the end..."
