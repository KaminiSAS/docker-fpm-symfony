FROM php:7-fpm-alpine

RUN apk add --no-cache --virtual .persistent-deps \
    acl \
    icu-libs \
    libpq \
 && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    icu-dev \
    postgresql-dev \
 && docker-php-ext-install \
    intl \
    opcache \
    pdo_pgsql \
    sockets \
 && apk del .build-deps

ADD symfony.ini /usr/local/etc/php/conf.d/

ENV HTTPD_USER www-data
ENV CONSOLE_USER 1000

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]
CMD ["php-fpm"]
