FROM php:5.6-apache
MAINTAINER Pitchanon Dumrongsiri <Pitchanon.d@gmail.com>
EXPOSE 80

ENV PHPREDIS_VERSION 2.2.8

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
        # cron \
        git-core \
        unzip \
        # libgearman-dev \
        # gearman-job-server \
    && rm -rf /var/lib/apt/lists/*

# RUN pecl install gearman \
    # && docker-php-ext-enable gearman

RUN pecl install redis-$PHPREDIS_VERSION \
    && docker-php-ext-enable redis

COPY docker/default.conf /etc/apache2/sites-available/000-default.conf
COPY docker/php.ini $PHP_INI_DIR
COPY docker/start.sh /usr/src/start.sh
RUN chmod +x /usr/src/start.sh

# WORKDIR /etc/cron.d
# COPY docker/crontab php-redis-admin
# RUN chmod 0644 php-redis-admin

# WORKDIR /var/www/html
# COPY php-redis-admin php-redis-admin
# RUN chown -R www-data:www-data php-redis-admin/var/log

WORKDIR /var/www/html/php-redis-admin
# RUN php composer.phar install --no-dev

# Setup the Composer installer
# RUN curl -sS https://getcomposer.org/installer | \
    # php -- --install-dir=/usr/bin/ --filename=composer
# RUN composer install --no-dev --no-interaction -o

# Setup the Composer installer
# RUN curl -s http://getcomposer.org/installer | php
# RUN php composer.phar --no-plugins --no-scripts create-project -s dev erik-dubbelboer/php-redis-admin .

ENTRYPOINT [ "/usr/src/start.sh" ]
