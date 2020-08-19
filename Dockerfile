
# this is our first build stage, it will not persist in the final image
FROM ubuntu as intermediate

# install git
RUN apt-get update
RUN apt-get install -y git

# add credentials on build
#ARG SSH_PRIVATE_KEY
#RUN mkdir /root/.ssh/
#RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

# make sure your domain is accepted
#RUN touch /root/.ssh/known_hosts
#RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts

RUN git clone https://github.com/moodle/moodle.git
RUN git checkout tags/v3.6.4 -b mp-14-create-moodle-docker-image-compose


###########################################################################3
FROM nginx:latest

RUN apt update
RUN apt install software-properties-common
#sudo add-apt-repository ppa:ondrej/php
#add-apt-repository ppa:ondrej/php
RUN apt install wget
RUN wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
RUN wget -q https://packages.sury.org/php/apt.gpg -O- |  apt-key add -
RUN echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list
RUN apt update
RUN apt install php php-fpm
RUN apt install php-common
RUN apt install php-mbstring
RUN apt install php7.1-xmlrpc php7.1-soap php7.1-gd php7.1-xml php7.1-intl php7.1-mysql php7.1-cli php7.1-mcrypt php7.1-ldap php7.1-zip php7.1-curl
RUN apt install php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-mcrypt php-ldap php-zip php-curl
RUN apt install php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli  php-ldap php-zip php-curl
#php -version
#php -m | grep mcrypt
RUN apt-get install php-dev libmcrypt-dev php-pear
RUN pecl channel-update pecl.php.net
RUN pecl install channel://pecl.php.net/mcrypt-1.0.2


#Install php extension 'mcrypt'
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions mcrypt

#php -m | grep mcrypt
#apt install vim
#vi ~/.vimrc
#vi /etc/php/7.3/cli/php.ini 
#php -m | grep mcrypt


#Download moodle

RUN mkdir /var/www/html -p

#ADD https://github.com/moodle/moodle/archive/v3.6.4.tar.gz /var/www/html/

#RUN tar --directory=/var/www/html/moodle -xvzf v3.6.4.tar.gz 

# copy the repository form the previous image
COPY --from=intermediate /moodle /var/www/html/moodle

RUN chmod 777 /var/www/html/moodle -R


#Copy config file of moodle

COPY ./config/moodle.conf  /etc/nginx/conf.d/moodle.conf

RUN mv /etc/nginx/conf.d/default.conf /etc/


#mkdir /var/www/html/moodledata/
#service php7.3-fpm status
RUN service php7.3-fpm start
#service php7.3-fpm status
#ls /run/php/
service php7.3-fpm start
#ls /run/php/php7.3-fpm.sock 
#ls /run/php/php7.3-fpm.sock -llh
RUN chmod 777 /run/php/ -R
#ls /var/www/html/moodle/config-dist.php 
chmod 777 /var/www/html/

