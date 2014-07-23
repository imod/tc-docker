FROM     ubuntu:12.04
MAINTAINER Dominik Bartholdi (imod) 



# make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' |chpasswd

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget pwgen

ENV TOMCAT_VERSION 7.0.54
ENV CATALINA_HOME /tomcat

# INSTALL TOMCAT
RUN wget http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O tomcat.tar.gz
RUN tar zxf tomcat.tar.gz && rm tomcat.tar.gz && mv apache-tomcat* tomcat

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

#ADD my.war /tomcat/webapps/my.war


CMD ["/run.sh"]


EXPOSE 8080
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
