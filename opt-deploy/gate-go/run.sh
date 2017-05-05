#!/bin/bash
IP="10.100.100.31"
DOMAIN="downloads.vikduo.com"
GO_PACKAGE="go_gateway.tar.xz"
WORK_DIR=$PWD

echo $IP $DOMAIN>>/etc/hosts;

# condition
cd _code_
rm __*
wget http://${DOMAIN}/go/${GO_PACKAGE}
mkdir -p go && tar -xf ${GO_PACKAGE} -C go
rm -rf ${GO_PACKAGE} 
mv go __go
cd ..
docker build -t opt/gate-go .


