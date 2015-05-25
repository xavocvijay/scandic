FROM ubuntu:latest
MAINTAINER Romans <me@nearly.guru>

# This dockerfile is suitable for installing Wordpress
# installation. The script will also look for /data volume
# in anticipation of an existing wordpress install. If it's
# found, then it will analyse it's contents and will
# link assets like this:
#
#  data/wp-content folder symlinked
#  data/.htaccess symlinked
#  data/init.sh script initialized

RUN echo 1234
RUN apt-get update
RUN apt-get   -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \

        mysql-client \
        apache2 \
        libapache2-mod-php5 \
        php5-mysql  \
        php5-ldap \
        php5-gd \
        php5-curl \
        nullmailer bsd-mailx \
        curl git \
        php-pear && rm -rf /var/lib/apt/lists/*

RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini
RUN sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/cli/php.ini
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite
RUN a2enmod headers

# Configure nullmailer
ADD files/etc/nullmailer /etc/nullmailer
ADD files/etc/nullmailer.live /etc/nullmailer.live


# Basic setup
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
ADD . /app
ADD frontend/public/.htaccess-distrib /app/frontend/public/.htaccess
ADD admin/public/.htaccess-distrib /app/admin/public/.htaccess
RUN cd /app && composer install
RUN cd /app/vendor/atk4/atk4 && git pull origin master

RUN mkdir /app/frontend/logs /app/admin/logs
RUN chgrp www-data /app/frontend/logs /app/admin/logs
RUN chmod g+w /app/frontend/logs /app/admin/logs



# Use our default config
#ADD config-deploy.php /app/config.php
#ADD admin/config-deploy.php /app/admin/config.php

# Initialize custom config from volume
ADD volume-init.sh /volume-init.sh
RUN chmod 755 /volume-init.sh

# Configure and start apache
ADD vhost.conf /etc/apache2/sites-enabled/000-default.conf
ADD run.sh /run.sh
ADD live.sh /live.sh

EXPOSE 80
WORKDIR /app
CMD /run.sh
