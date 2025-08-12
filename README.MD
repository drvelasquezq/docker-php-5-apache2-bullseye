# Descripción
Este proyecto da los pasos para utilizar y crear imagen de docker que ejecuta una aplicación en PHP 5 integrando Apache en Debian

<ul>
<li>Apache: 2.4.62</li>
<li>PHP: 5.6.40</li>
<li>Debian: Bullseye</li>
</ul>

## Docker hub
[https://hub.docker.com/repository/docker/drvelasquezq/php-5-apache2-bullseye/general](https://hub.docker.com/repository/docker/drvelasquezq/php-5-apache2-bullseye/general)

## caracteristicas

<ul>
<li>Permite depurar el código con VS Code con Xdebug 2.5.5 con Docker</li>
</ul>

## Uso

```bash
# clonar proyecto
git clone https://github.com/drvelasquezq/docker-php-5-apache2-bullseye.git
# ingresar al proyecto
cd docker-php-5-apache2-bullseye
# crear contenedor
docker compose up -d
```

luego podrá ingresar a: http://localhost:8079

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
docker run --tty --interactive -p 8079:80 --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0 bash
# en el contenedor arrancar apache con
apachectl start
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano

```bash
docker run -d -p 8079:80 --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0
# para luego ingresar al contenedor
docker exec -ti container-php-5-apache2-bullseye bash
```

### ejemplo para crear contenedor con la imagen y ejecutarlo en segundo plano con volumen

```bash
docker run -d -p 8079:80 --volume ./var/www/project-debug:/var/www/project-debug --name container-php-5-apache2-bullseye drvelasquezq/php-5-apache2-bullseye:1.0.0
# para luego ingresar al contenedor
docker exec -ti container-php-5-apache2-bullseye bash
```

### ejemplo para remover contenedor

```bash
docker rm -f container-php-5-apache2-bullsey
```

### ejemplo de copia de archivo

```bash
docker cp container-php-5-apache2-bullseye:/etc/php/5.6/cli/php.ini ./etc/php/5.6/cli/
```

### ejemplo para subir imagen a docker hub

```bash
# etiquetar si es necesario
docker tag drvelasquezq/php-5-apache2-bullseye:1.0.0 usuario/php-5-apache2-bullseye:1.0.0
```

```bash
docker push drvelasquezq/php-5-apache2-bullseye:1.0.0
```
