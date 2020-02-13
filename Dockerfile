# Web Performance Measuring Agent

FROM centos:centos8 
MAINTAINER "mirko@ebert-p.com"
#ENV TERM xterm-256color

RUN yum update  -y
RUN yum install -y wget curl gzip tar iotop htop lzma git 
RUN yum install -y httpd

#RUN mkdir -p root
RUN mkdir -p root/.ssh
COPY github_deploy     /root/.ssh/id_rsa
COPY github_deploy.pub /root/.ssh/id_rsa.pub
RUN  ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts 
COPY config          /root/.ssh/config
COPY known_hosts     /root/.ssh/known_hosts

RUN cd root; git clone git@github.com:mirkoebert/simpleserverprobeagent.git
#RUN cd root; git clone https://github.com/mirkoebert/simpleserverprobe
RUN cd simpleserverprobeagent

#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# copy known hosts
#EXPOSE 8500
#ENTRYPOINT ["/usr/sbin/apachectl", "-D", "FOREGROUND"]


