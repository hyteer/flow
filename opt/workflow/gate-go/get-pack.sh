#!/bin/bash
IP="10.100.100.31"
DOMAIN="downloads.vikduo.com"
GO_PACKAGE="go_gateway.tar.xz"
WORK_DIR=$PWD

echo $IP $DOMAIN>>/etc/hosts;

# condition
mkdir -p _code_ && cd _code_
rm __*
mv go __go
wget http://${DOMAIN}/go/${GO_PACKAGE}
mkdir -p go && tar -xf ${GO_PACKAGE} -C go

#docker build -t opt/gate-go .
#mv go __go



