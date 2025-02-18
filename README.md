# Introduction

This project contains PHP:8.4-Apache docker image extended with popular extensions. 

The image is intended to be used with a locally-runned MariaDB/MySql (using the host network / `--network=host` docker option) or inside the same pod as the MariaDB/MySql service. 

The mysql socket is redirected by socat to localhost:3306, so `localhost` (without port) may be used in php code to connect to the mysql database.

In `build.sh`, the targeted image is minified by [slimtoolkit](https://github.com/slimtoolkit/slim).

# Available extensions

The following extensions are available in addition to those in the official PHP docker image.

`apcu` `bz2` `bcmath` `exif` `gd` `iconv` `intl` `mongodb` `mysqli` `opcache` `pdo_mysql` `pdo_pgsql` `pgsql`
`redis` `rdkafka` `sockets` `zip`

# Basic usage

```
docker run -d --rm --network=host --name php8 -v "./www":/var/www/html mxmfrlv/php-apache:latest
```
```
docker-compose up -d
```
```
podman play kube kubeconfig.yaml
```
# Debugging running slim container with podman
`./podman-debug.sh` or `./podman-debug.sh container_name` (for other container name than `php8`).

Under docker, a [slimtoolkit](https://github.com/slimtoolkit/slim) `debug` or [cdebug](https://github.com/iximiuz/cdebug) `exec` may be used.

# See also
- [asimlqt/docker-php](https://github.com/asimlqt/docker-php)
- [slimtoolkit](https://github.com/slimtoolkit/slim)
- [cdebug](https://github.com/iximiuz/cdebug)

