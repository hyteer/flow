#!/bin/bash
date
SRV_NAME="service-third-party-interface"
WORKDIR=${PWD}
CODE="${WORKDIR}/_code_/${SRV_NAME}"
####

# thrift gen
cd ${CODE}
echo "===生成thrift code..."
chmod +x thrift-file-generate.sh
./thrift-file-generate.sh
echo "===生成结果..."
ls thriftServices

# build image
echo "===Build docker image..."
cd ${WORKDIR} && ls
chmod +x scripts/*
docker build -t opt/${SRV_NAME} .
#rm -rf ${CODE}
