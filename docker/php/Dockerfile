FROM php:7.1-fpm

# php & composer setup
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
	libxslt1-dev \
	libicu-dev \
	git \
    && docker-php-ext-install iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install exif
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install xsl
RUN docker-php-ext-install intl
RUN docker-php-ext-install opcache
RUN docker-php-ext-install zip
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN pecl install redis
RUN docker-php-ext-enable redis
COPY php.ini /usr/local/etc/php/php.ini

RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# nodejs setup
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs

# yarn setup
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install yarn

# install global gulp
RUN yarn global add gulp

# user setup
RUN groupmod -g 1000 www-data
RUN usermod -u 1000 -s /bin/bash www-data
RUN chown -R www-data:www-data /var/www
COPY inputrc /var/www/.inputrc

COPY entrypoint.sh /entrypoint.sh

WORKDIR /srv/app
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
