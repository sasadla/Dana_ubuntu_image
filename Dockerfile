FROM ubuntu:latest
MAINTAINER Saarim Aatri Sadla "saarimaatri@hotmail.com"

RUN ["apt-get", "update"]
RUN ["apt-get", "-yq", "upgrade"]
RUN ["apt-get", "install", "-y", "vim"]

ADD . /usr/bin/dana_home
WORKDIR /usr/bin/dana_home/dana_ubu64_[215]

RUN chmod +x dana dnc
RUN echo 'export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> /etc/bash.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> /etc/bash.bashrc
RUN echo 'export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> ~/.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc

RUN echo 'export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> ~/.profile
RUN echo 'PATH=$PATH:$DANA_HOME' >> ~/.profile


RUN /bin/bash -c "source /etc/bash.bashrc"
RUN /bin/bash -c "source ~/.bashrc"
RUN /bin/bash -c "source ~/.profile"


ENV export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215] \
	PATH=$PATH:$DANA_HOME/bin/dana_home


RUN sed -i "s#DANA_HOME#"${DANA_HOME}"#g" /usr/bin/dana_home/dana_ubu64_[215]

WORKDIR /