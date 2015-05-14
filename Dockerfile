from debian:wheezy

MAINTAINER Sylvain Boily "sboily@avencall.com"

ENV DEBIAN_FRONTEND noninteractive

RUN groupadd builder
RUN useradd -r -g builder builder -s /bin/bash
RUN mkdir -p /home/builder/
RUN chown builder.builder /home/builder/
ADD etc/xivo-build-tools/ /etc/xivo-build-tools/
ADD bin/xivo-build-tools /usr/bin/

RUN echo 'deb http://ftp.ca.debian.org/debian/ wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports.list
RUN apt-get -yqq update
RUN apt-get -yqq install devscripts \
                    cdbs \
                    dput \
                    lintian \
                    libdistro-info-perl \
                    libparse-debcontrol-perl \
                    fakeroot \
                    dh-python \
                    sudo
