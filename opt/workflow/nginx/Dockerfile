FROM nginx
ENV BASE_DIR="/data" \
    CODE="_code_" \
    NGINX_DIR="/etc/nginx"
ENV WEB_DIR="${BASE_DIR}/www"
#
ADD sources.list /etc/apt/sources.list
RUN mkdir -p ${WEB_DIR} /scripts ${NGINX_DIR}/logs && \
    apt-get update && \
    apt-get install -y nano net-tools && \
    apt-get clean
#
ADD ${CODE} ${WEB_DIR}
ADD conf ${NGINX_DIR}
ADD scripts /scripts
RUN /scripts/deploy.sh
#CMD ["/scripts/start.sh"]


