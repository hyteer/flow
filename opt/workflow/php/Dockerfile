FROM php:5.6.30-cli
ADD source.list /etc/apt/source.list
RUN apt-get update \
    && apt-get install -y libevent-dev \
    && docker-php-ext-install -j$(nproc) pcntl sysvshm sysvsem \
    && pecl install libevent-0.1.0 \
    && docker-php-ext-enable libevent
RUN apt-get install -y nano net-tools thrift-compiler && \
    mkdir -p /scripts /data/www
