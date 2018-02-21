FROM ubuntu
MAINTAINER Saarim Aatri Sadla "saarimaatri@hotmail.com"

RUN set -x \ 
     && apt-get update \ 
	 && apt-get -yq upgrade \
     && apt-get install --no-install-recommends -y \ 
         build-essential libffi-dev libxml2-dev libxslt-dev libpq-dev \ 
         $(if [ "$DEVEL" = "yes" ]; then echo 'libjpeg-dev'; fi) 

ADD . /usr/bin/dana_home
WORKDIR /usr/bin/dana_home/dana_ubu64_[215]

RUN chmod +x dana dnc
RUN echo 'export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> /etc/bash.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> /etc/bash.bashrc
RUN echo 'export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]' >> ~/.bashrc
RUN echo 'PATH=$PATH:$DANA_HOME' >> ~/.bashrc

RUN /bin/bash -c "source /etc/bash.bashrc"
RUN /bin/bash -c "source ~/.bashrc"

ENV export DANA_HOME=/usr/bin/dana_home/dana_ubu64_[215]
ENV PATH=$PATH:$DANA_HOME

WORKDIR /