FROM ubuntu:22.04

LABEL author.name="bkacad"
LABEL author.email=devops@bkacad.edu.com.vn

RUN apt-get update -y && \
    apt-get install curl -y && \
    apt-get install apache2 -y && \
    apt-get install vim -y && \
    apt-get install git -y

ENV TZ=Asia/Ho_Chi_Minh
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/lib/apache/runtime
RUN mkdir -p ${APACHE_RUN_DIR}
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid 
ENV APACHE_SERVERNAME localhost 
ENV APACHE_SERVERALIAS docker.localhost 
ENV APACHE_DOCUMENTROOT /var/www/html

WORKDIR /var/www/html
COPY docker.html .

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
