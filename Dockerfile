from debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/builder

RUN echo 'deb-src http://mirror.xivo.io/debian/ xivo-dev main' > /etc/apt/sources.list.d/xivo.list
RUN apt-get -yqq update
RUN apt-get -yqq install devscripts \
                    cdbs \
                    dput \
                    lintian \
                    libdistro-info-perl \
                    libparse-debcontrol-perl \
                    fakeroot \
                    dh-python \
                    python-setuptools \
                    python-all \
                    sudo

RUN groupadd builder
RUN useradd -r -g builder -G sudo -s /bin/bash -u 1000 builder
RUN mkdir -p /home/builder/packages
RUN chown -R builder.builder /home/builder/
ADD etc/xivo-build-tools/ /etc/xivo-build-tools/
ADD bin/xivo-build-tools /usr/bin/
RUN echo 'builder ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/builder
RUN chmod 440 /etc/sudoers.d/builder

ADD entrypoint.sh /

CMD bash -C '/entrypoint.sh';'bash'
