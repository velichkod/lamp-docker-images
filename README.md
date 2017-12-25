# lamp-docker-images
Docker images for everyday use in PHP + MySQL development

# MySQL
MySQL image is based on Docker mysql:5.7 image with minor tuning of mysqld configuration file

# PHP
PHP Image is based on the Docker php:5.6-apache image, having only PDO and MySQL extensions installed, and Apache Rewrite module enabled.
Feel free to extend it for your needs.

# Configuration
.env file in the root folder can be used to configure the environment variables
for the Docker images and docker-compose file generation. Variables available:
  * project_prefix - prefix to be added in service and container names, for example "myproject"
  * mysql_image_tag - string ID for the MySQL image tagging
  * php_image_tag - string ID for the PHP image tagging
  * virtual_host - Virtual host name, for ex. "myproject.local"
  * mysql_root_password - Password for the MySQL root user
  * mysql_database - MySQL default database name
  * mysql_user - MySQL username
  * mysql_password - MySQL password


# Building
build.sh is running build commands for the PHP and MySQL images, generating the
docker-compose.yml file in the virtualhost subfolder that can be used to run the LAMP application.
