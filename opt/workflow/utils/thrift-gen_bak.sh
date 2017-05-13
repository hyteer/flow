#!/bin/sh
for thriftFiles in `ls thriftFiles`
do
    echo generate file thriftFiles/${thriftFiles}
    thrift -out . --gen php:server thriftFiles/${thriftFiles}
done
