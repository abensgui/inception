sleep 20

mkdir /run/php
wp core download --path='/var/www/html/wordpress' --allow-root 
chmod -R 777 /var/www/html/wordpress/wp-content
wp config create --allow-root --dbname=$db_name --dbuser=$db_user --dbpass=$db_pwd --dbhost=mariadb --path='/var/www/html/wordpress'
wp core install --title=$WP_TITLE --url=$DOMAIN_NAME --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --locale='mariadb' --skip-email --path='/var/www/html/wordpress' --allow-root

wp user create $db_user $WP_EMAIL --user_pass=$db_pwd --path='/var/www/html/wordpress' --allow-root



/usr/sbin/php-fpm7.4 -F