FROM 10.100.100.130:5000/opt/srv-baseimage
ENV BASE="/data"
ENV WEB_PATH="${BASE}/www"

ADD _code_ ${WEB_PATH}

# deploy
ADD scripts /scripts
WORKDIR ${WEB_PATH}
RUN pwd && ls && /scripts/deploy.sh

# start
#CMD /scripts/start.sh
