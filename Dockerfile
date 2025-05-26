FROM debian:bullseye

RUN apt-get update && \
    apt-get clean

# apache
RUN apt install -y apache2 && \
    ## lynx  para apachectl status
    apt install -y lynx && \
    a2enmod rewrite && \
    a2enmod headers && \
    apt-get clean

# versionamiento
RUN apt-get install -y git && \
    apt-get clean

#herramientas para manejo de contenedor
RUN apt install iputils-ping -y && \
    apt install net-tools -y && \
    apt install curl -y && \
    apt install netcat -y && \
    apt install nano -y && \
    apt install wget -y && \
    apt-get clean

# herramientas para instalar php en versión especifica
RUN apt install software-properties-common -y && \
    apt install ca-certificates  -y && \
    apt install lsb-release -y && \
    apt install apt-transport-https -y && \
    apt install gnupg -y && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt-get update && \
    apt-get clean

# php 5.6
RUN apt install php5.6 -y && \
    apt-get clean

# extensiones de php
RUN apt install php5.6-xdebug -y && \
    apt-get clean

COPY ./etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./etc/php/5.6/apache2/php.ini /etc/php/5.6/apache2/php.ini
COPY ./etc/php/5.6/cli/php.ini /etc/php/5.6/cli/php.ini

EXPOSE 80

WORKDIR /var/www

COPY ./var/www/index.php /var/www/index.php

COPY ./scripts/script.sh /scripts/script.sh

CMD [ "/bin/sh", "/scripts/script.sh" ]