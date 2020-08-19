##phase 1
#FROM jgoerzen/debian-base-minimal:stretch

##############################phase 2##############################
#FROM tempproject/moodle:debian-base-minimal
##Install git
#RUN apt update && apt -y install git


##############################phase 3##############################
#FROM tempproject/moodle:debian-git

##Clone nd copy moodle@github
#RUN mkdir -p /home/tools/moodle
##RUN git clone https://github.com/moodle/moodle.git
#ADD ./moodle /home/tools/moodle  
#RUN cd /home/tools/moodle
#RUN git checkout tags/v3.6.4 -b mp-14-create-moodle-docker-image-compose

##############################phase 3#############################
FROM tempproject/moodle:debian-git
RUN apt-get update && apt-get -y install cron



############################phase 4###############################
#COPY ./postStart.sh /
#RUN chmod +x /postStart.sh

## Copy cronjob file to the cron.d directory
#COPY ./cronjob /etc/cron.d/
## Give execution rights on the cron job
#RUN chmod 0644 /etc/cron.d/cronjob

## Apply cron job
#RUN crontab /etc/cron.d/cronjob

### Create the log file to be able to run tail
##RUN touch /var/log/cron.log

### Run the command on container startup
##CMD cron #&& tail -f /var/log/cron.log



## Install required system packages and dependencies
#RUN install_packages cron libbz2-1.0 libc6 libcomerr2 libcurl3 libexpat1 libffi6 libfreetype6 libgcc1 libgcrypt20 libgmp10 libgnutls30 libgpg-error0 libgssapi-krb5-2 libhogweed4 libicu57 libidn11 libidn2-0 libjpeg62-turbo libk5crypto3 libkeyutils1 libkrb5-3 libkrb5support0 libldap-2.4-2 liblzma5 libmcrypt4 libmemcached11 libmemcachedutil2 libncurses5 libnettle6 libnghttp2-14 libp11-kit0 libpcre3 libpng16-16 libpq5 libpsl5 libreadline7 librtmp1 libsasl2-2 libsqlite3-0 libssh2-1 libssl1.0.2 libssl1.1 libstdc++6 libsybdb5 libtasn1-6 libtidy5 libtinfo5 libunistring0 libxml2 libxslt1.1 zlib1g
#RUN  unpack apache-2.4.39-1 --checksum 8b191adc55155e604cc224309a0179585f898dff83a470272d5fa5cbefc4c17e
#RUN  unpack php-7.1.29-0 --checksum cd0fba56de5fc1fa5c3d4eb5ef85bcd613cf0875fefe37beaddc9327f5cd7d8e
#RUN  unpack mysql-client-10.1.40-0 --checksum a5c2274fd7aa82aa199f9d1ce57bb173e4a80fdc638fb1525146da06c6d1b7f0
#RUN  unpack libphp-7.1.29-0 --checksum cd6c0c8fdd006dcb730cc4fe3c42420c00f2db9641353be735b8e29f579c34f8
#RUN  unpack moodle-3.6.4-0 --checksum 819f8631fffb511c204743d25454a7993672926287f7ff06162d344517daaee6
#RUN mkdir -p /opt/temp_dir/apache/tmp && chmod g+rwX /opt/temp_dir/apache/tmp
#RUN sed -i -e '/pam_loginuid.so/ s/^#*/#/' /etc/pam.d/cron
#RUN ln -sf /dev/stdout /opt/temp_dir/apache/logs/access_log
#RUN ln -sf /dev/stderr /opt/temp_dir/apache/logs/error_log

#COPY rootfs /
#ENV ALLOW_EMPTY_PASSWORD="no" \
#    APACHE_HTTPS_PORT_NUMBER="443" \
#    APACHE_HTTP_PORT_NUMBER="80" \
#    temp_APP_NAME="moodle" \
#    temp_IMAGE_VERSION="3.6.4-debian-9-r6" \
#    MARIADB_HOST="mariadb" \
#    MARIADB_PORT_NUMBER="3306" \
#    MARIADB_ROOT_PASSWORD="" \
#    MARIADB_ROOT_USER="root" \
#    MOODLE_DATABASE_NAME="temp_moodle" \
#    MOODLE_DATABASE_PASSWORD="" \
#    MOODLE_DATABASE_USER="bn_moodle" \
#    MOODLE_EMAIL="user@example.com" \
#    MOODLE_LANGUAGE="en" \
#    MOODLE_PASSWORD="password" \
#    MOODLE_SITENAME="New Site" \
#    MOODLE_USERNAME="user" \
#    MYSQL_CLIENT_CREATE_DATABASE_NAME="" \
#    MYSQL_CLIENT_CREATE_DATABASE_PASSWORD="" \
#    MYSQL_CLIENT_CREATE_DATABASE_PRIVILEGES="ALL" \
#    MYSQL_CLIENT_CREATE_DATABASE_USER="" \
#    PATH="/opt/temp_dir/apache/bin:/opt/temp_dir/php/bin:/opt/temp_dir/php/sbin:/opt/temp_dir/mysql/bin:$PATH" \
#    SMTP_HOST="" \
#    SMTP_PASSWORD="" \
#    SMTP_PORT="" \
#    SMTP_PROTOCOL="" \
#    SMTP_USER=""

#EXPOSE 80 443

#ENTRYPOINT [ "/app-entrypoint.sh" ]
#CMD [ "/run.sh" ]
