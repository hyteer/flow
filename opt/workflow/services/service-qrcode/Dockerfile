FROM opt/php
ENV BASE="/data"
ENV WEB_PATH="${BASE}/www"

ADD _code_ ${WEB_PATH}

# deploy
ADD scripts /scripts
RUN cd ${BASE} && /scripts/deploy.sh
# start
CMD /scripts/start.sh
