############################################################
# Dockerfile to build CentOS,Nginx installed  Container
# Based on CentOS
############################################################

# Set the base image to Ubuntu
FROM centos:latest

# File Author / Maintainer
MAINTAINER Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>

# Add the ngix repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Intalling the nginx 
RUN yum -y install nginx

# Adding the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Adding the default file
ADD index.html /var/www/index.html

# Set the port to 80 
EXPOSE 80

# Execut the nginx
CMD ["/usr/sbin/nginx"]
