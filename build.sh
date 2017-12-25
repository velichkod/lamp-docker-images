#!/bin/sh

if [ -f ./.env ]
  then
    . ./.env
fi

pwd=`pwd`;

cd ${pwd}/mysql
docker_mysql_image_tag=${mysql_image_tag:-dev/mysql:latest}
docker build -t ${docker_mysql_image_tag}  ./

cd ${pwd}/php
docker_php_image_tag=${php_image_tag:-dev/php:latest}
docker build -t ${docker_php_image_tag} ./

docker_virtual_host=${virtual_host:-virtual_host.local}
docker_project_prefix=${project_prefix:-prefix}

cd ${pwd}/virtualhost
cp ./docker-compose-template.yml ./docker-compose.yml


sed -i -e 's@{mysql_image}@'"${docker_mysql_image_tag}"'@g' ./docker-compose.yml
sed -i -e "s@{mysql_root_password}@${mysql_image}@g" ./docker-compose.yml
sed -i -e "s@{mysql_database}@${mysql_image}@g" ./docker-compose.yml
sed -i -e "s@{mysql_user}@${mysql_image}@g" ./docker-compose.yml
sed -i -e "s@{mysql_password}@${mysql_image}@g" ./docker-compose.yml
sed -i -e "s@{php_image}@${docker_php_image_tag}@g" ./docker-compose.yml
sed -i -e "s@{project_prefix}@${docker_project_prefix}@g" ./docker-compose.yml
sed -i -e "s@{virtual_host}@${docker_virtual_host}@g" ./docker-compose.yml

docker-compose -f ./docker-compose.yml build
