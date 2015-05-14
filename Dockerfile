from debian:wheezy


ADD http://mirror.lan-quebec.avencall.com/key.asc /tmp/
RUN apt-key add /tmp/key.asc
RUN echo 'deb http://mirror.lan-quebec.avencall.com/ xivo-dev-tools main' > /etc/apt/sources.list.d/xivo-dev-tools.list
RUN echo 'deb http://ftp.ca.debian.org/debian/ wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports.list
RUN apt-get -y update
RUN apt-get -y install xivo-build-tools
