FROM ubuntu:latest

RUN ["apt-get", "update"]
RUN ["apt-get", "-yq", "upgrade"]
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "iputils-ping"]

ADD . /usr/bin/dana_home
WORKDIR /usr/bin/dana_home/dana_ubu64_[215]

RUN chmod +x dana dnc

RUN echo 'DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> ~/.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"


ENV DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]
ENV PATH=$PATH:$DANA_HOME

WORKDIR /