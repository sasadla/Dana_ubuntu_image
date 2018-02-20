FROM ubuntu
MAINTAINER Saarim Aatri Sadla "saarimaatri@hotmail.com"
RUN apt-get -yq update
RUN apt-get -yq upgrade
ADD . /dana_home
WORKDIR /dana_home/dana_ubu64_[215]
RUN chmod +x dana dnc
RUN echo 'export DANA_HOME=/dana_home/dana_ubu64_[215]' >> /etc/bash.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/bash.bashrc"
ENTRYPOINT ["/dana_home"]