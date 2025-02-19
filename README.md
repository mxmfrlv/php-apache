# Introduction

This project contains PHP:8.4-Apache docker image with some [additional extensions](#available-php-extensions). 

The image is intended to be used with a locally-runned MariaDB/MySql (using the host network / `--network=host` docker option) or inside the same pod as the MariaDB/MySql service. The default exposed port is **8080**.

The mysql socket is redirected by socat to localhost:3306, so `localhost` (without port) may be used in php code to connect to the mysql database. Migrations from locally installed apache/php can be thus made without changing the php code.

The targeted image is minified by [slimtoolkit](https://github.com/slimtoolkit/slim) (see `build.sh`).

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

<a id="available-php-extensions"></a>
# Available php extensions

The following extensions are available

`apcu` `bcmath` `bz2` `exif` `gd` `gmp` `intl` `mongodb` `mysqli` `opcache` `pdo_mysql` `pdo_pgsql` `pgsql` `rdkafka` `redis` `sockets` `zip`

in addition to those in the official PHP docker image :

`
ctype, curl, date, dom, fileinfo, filter, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, pdo_sqlite, Phar, posix, random, readline, Reflection, session, SimpleXML, sodium, SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, zlib
`


# See also
- [asimlqt/docker-php](https://github.com/asimlqt/docker-php)
- [slimtoolkit](https://github.com/slimtoolkit/slim)
- [cdebug](https://github.com/iximiuz/cdebug)

