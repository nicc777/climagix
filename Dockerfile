FROM ubuntu:latest

MAINTAINER Nico Coetzee <nicc777@gmail.com>

LABEL Description="An Ubuntu based CLI focused container - to be used interactively" Vendor="none" Version="0.1"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y less vim weechat emacs mc links2 wget python3 python3-pip screen sudo git wget curl 
RUN pip3 install --upgrade pip
RUN pip3 install awscli boto3 

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/auser && \
    echo "auser:x:${uid}:${gid}:Developer,,,:/home/auser:/bin/bash" >> /etc/passwd && \
    echo "auser:x:${uid}:" >> /etc/group && \
    echo "auser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/auser && \
    chmod 0440 /etc/sudoers.d/auser && \
    chown ${uid}:${gid} -R /home/auser

VOLUME ['/home/auser']

USER auser
ENV HOME /home/auser
RUN cd /home/auser

CMD while [ 1 ]; do sleep 60; done
