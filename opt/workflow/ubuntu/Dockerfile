FROM ubuntu:xenial 
ADD sources.list  /etc/apt/sources.list
RUN mkdir -p /data/tools && \
    apt-get update && \
    apt-get install -y nano net-tools && \
    apt-get clean && apt-get autoclean
ADD tools /data/tools
RUN cp /data/tools/ping /bin/

