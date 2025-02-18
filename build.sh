docker pull php:8.4-apache
docker build -t mxmfrlv/php-apache:8.4-fat .

# installing slim:
curl -L -o ds.tar.gz https://github.com/slimtoolkit/slim/releases/download/1.40.11/dist_linux.tar.gz
tar -xvf ds.tar.gz
mv dist_linux/* /usr/local/bin/
docker-slim build --exclude-varlock-files --target mxmfrlv/php-apache:8.4-fat

docker tag mxmfrlv/php-apache.slim mxmfrlv/php-apache:8.4-slim
docker tag mxmfrlv/php-apache.slim mxmfrlv/php-apache:latest
