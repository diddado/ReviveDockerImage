FROM alpine
MAINTAINER diddado <git@diddado.com>

WORKDIR /var/www/html

RUN apk --update upgrade && apk update && apk add curl ca-certificates && update-ca-certificates --fresh && apk add openssl

RUN apk --update add \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        nginx \
        gzip \
        php7 \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-xml \
        php7-iconv \
        php7-phar \
        php7-openssl \
        php7-zlib \
        php7-zip \
    && rm -rf /var/cache/apk/*


# We want to make sure the md5 sum matches, if not fail the build since someone has modified the file.
RUN set -o pipefail && wget -q https://download.revive-adserver.com/revive-adserver-5.2.0.tar.gz \
    && if test `md5sum revive-adserver-5.2.0.tar.gz | cut -b-32` = "a6af2dedf80592137fa177f5cfed8061"; then \
    tar --strip 1 -zxf revive-adserver-5.2.0.tar.gz && rm -f revive-adserver-5.2.0.tar.gz \
    && chown -R nobody:nobody . \
    && rm -rf /var/cache/apk/*; else exit 1; fi;

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE 80

CMD php-fpm7 && nginx -g 'daemon off;'
