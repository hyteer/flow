#!/bin/bash
date
SRV_NAME="service-third-party-interface"
WORKDIR=${PWD}
CODE="${WORKDIR}/_code_/${SRV_NAME}"
####

# thrift gen
cd ${CODE}
echo "===生成thrift code..."
    for file in ./thriftFiles/*.thrift
    do
        if test -f ${file}
        then
        	file2=`echo ${file}|cut -c 3-`
            docker run -v "$PWD:/data" thrift thrift -o /data --gen php:server /data/${file2}
        else
            echo "${file} is not a file..."
        fi
    done
cp -rf gen-php/thriftServices/* thriftServices/
echo "===生成结果..."
ls thriftServices

# build image
echo "===Build docker image..."
cd ${WORKDIR} && ls
chmod +x scripts/*
docker build -t opt/${SRV_NAME} .
#rm -rf ${CODE}
