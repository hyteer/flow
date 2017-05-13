FROM opt/base 
ENV BASE_DIR="/data" \
    CODE="_code_" 
ENV GO_DIR="${BASE_DIR}/go"
RUN mkdir -p ${GO_DIR} /scripts 
ADD ${CODE}/go ${GO_DIR}
ADD scripts /scripts
RUN /scripts/deploy.sh
CMD ["/scripts/start.sh"]


