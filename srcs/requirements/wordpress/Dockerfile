FROM debian:11

WORKDIR /var/www/html/wordpress

RUN apt update && apt upgrade -y && apt-get -y install wget php-fpm php-mysql mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

COPY  tools/auto_config.sh .

COPY  conf/www.conf /etc/php/7.4/fpm/pool.d

RUN chmod +x auto_config.sh

CMD ["/bin/sh", "auto_config.sh"]