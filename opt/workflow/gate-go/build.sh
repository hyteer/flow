#!/bin/bash
date
SRV_NAME="gate-go"
WORKDIR=${PWD}
#CODE="${WORKDIR}/_code_/${SRV_NAME}"
####
#cd ${CODE}
#chmod +x thrift-file-generate.sh
# build image
echo "===Build docker image..."
cd ${WORKDIR} && ls
chmod +x scripts/*
docker build -t opt/${SRV_NAME} .
#rm -rf ${CODE}
