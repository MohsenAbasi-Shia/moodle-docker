#!/bin/bash
sudo docker exec -it moodle-docker_moodle_1 rm -rf /run/php/*
sudo docker exec -it moodle-docker_moodle_1 service php7.3-fpm start
sudo docker exec -it moodle-docker_moodle_1 chmod 777 /run/php -R
