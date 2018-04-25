FROM ubuntu:latest

RUN ["apt-get", "update"]
RUN ["apt-get", "-yq", "upgrade"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "iputils-ping"]
RUN ["apt-get", "install", "-y", "sudo"]

COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

ADD . /usr/bin/dana_home
WORKDIR /usr/bin/dana_home/dana_ubu64_[215]

RUN chmod +x dana dnc

RUN echo 'DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> ~/.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"


ENV DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]
ENV PATH=$PATH:$DANA_HOME

EXPOSE 2018

WORKDIR /
#/usr/bin/dana_home