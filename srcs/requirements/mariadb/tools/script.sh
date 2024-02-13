service mariadb start;
mariadb -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mariadb -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_pwd';"
mariadb -e "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' IDENTIFIED BY '$db_pwd';"
mariadb -e "FLUSH PRIVILEGES;"
sleep 1
mariadb -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mariadb-admin -u root -p$MYSQL_ROOT_PASSWORD shutdown
exec mariadbd-safe;