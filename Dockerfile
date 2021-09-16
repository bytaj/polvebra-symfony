ARG PHP_VERSION=8.0

FROM php:${PHP_VERSION}-fpm-alpine AS app_backend

WORKDIR /app

RUN apk --update upgrade \
	&& apk add --no-cache libxml2-dev autoconf automake make gcc g++ icu-dev \
	&& docker-php-ext-install \
	    intl \
	    pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

