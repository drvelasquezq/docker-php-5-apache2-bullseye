#!/bin/bash

# apachectl start

# TODO: verificar creación del archivo porque parece no estarlo haciendo porque otro proceso crea una carpeta con este nombre que parece ser el php.ini
#if [ ! -f /var/log/xdebug_remote.log ]; then
#    touch /var/log/xdebug_remote.log
#    chown www-data:www-data /var/log/xdebug_remote.log
#fi

apachectl -D FOREGROUND