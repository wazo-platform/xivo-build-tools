from debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/builder

RUN apt-get -yqq update
RUN apt-get -yqq install \
        cdbs \
        devscripts \
        dh-python \
        dput \
        fakeroot \
        git \
        libdistro-info-perl \
        libparse-debcontrol-perl \
        lintian \
        python-all \
        python-setuptools \
        sudo \
        wget

RUN echo 'deb http://mirror.wazo.community/debian/ wazo-dev main' >> /etc/apt/sources.list.d/wazo.list
RUN echo 'deb-src http://mirror.wazo.community/debian/ wazo-dev main' >> /etc/apt/sources.list.d/wazo.list
RUN wget -q http://mirror.wazo.community/wazo_current.key -O - | apt-key add -

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