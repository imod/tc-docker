FROM     ubuntu:12.04
MAINTAINER Dominik Bartholdi (imod) 

# make sure the package repository is up to date
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' |chpasswd

EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]

