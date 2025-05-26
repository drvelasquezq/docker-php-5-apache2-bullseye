# Descripción
Este proyecto da los pasos para utilizar y crear imagen de docker que ejecuta una aplicación en PHP 5 integrando Apache en Debian

<ul>
<li>Apache: 2.4.62</li>
<li>PHP: 5.6.40</li>
<li>Debian: Bullseye</li>
</ul>

## caracteristicas

<ul>
<li>Permite depurar el código con VS Code con Xdebug 2.5.5 con Docker</li>
</ul>

## ejemplos de comandos que pueden ejecutarse

### ejemplo para construir la imagen

```bash
docker build --no-cache --progress=plain --tag drvelasquezq/php-5-apache2-bullseye:1.0.0 . > output-build-image/output.log 2>&1
```

### ejemplo para crear contenedor que solo ejecute el script sh que ya está en la imagen

```bash
docker run --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0
```

### ejemplo para crear contenedor con la imagen y ejecutarlo de manera interactiva

```bash
docker run --tty --interactive -p 8080:80 --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0 bash
# en el contenedor arrancar apache con
apachectl start
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano

```bash
docker run -d -p 8080:80 --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0
## para luego ingresar al contenedor
docker exec -ti container-php-5-apache2-bullseye bash
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano con volumen

```bash
docker run -d -p 8080:80 --volume ./var/www/project-debug:/var/www/project-debug --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0
## para luego ingresar al contenedor
docker exec -ti container-php-5-apache2-bullseye bash
```

### ejemplo de copia de archivo

```bash
docker cp container-php-5-apache2-bullseye:/etc/php/5.6/cli/php.ini ./etc/php/5.6/cli/
```
