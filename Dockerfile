from debian:stretch

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

RUN true && \
    echo 'deb http://mirror.wazo.community/debian/ wazo-dev main' >> /etc/apt/sources.list.d/wazo.list && \
    echo 'deb-src http://mirror.wazo.community/debian/ wazo-dev main' >> /etc/apt/sources.list.d/wazo.list && \
    wget -q http://mirror.wazo.community/wazo_current.key -O - | apt-key add - && \
    useradd --groups sudo --shell /bin/bash --uid 1000 --create-home builder && \
    install --directory --owner builder /home/builder/packages && \
    echo 'builder ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/builder && \
    chmod 440 /etc/sudoers.d/builder && \
    true

ADD etc/xivo-build-tools/ /etc/xivo-build-tools/
ADD bin/xivo-build-tools /usr/bin/
ADD entrypoint.sh /

CMD bash -C '/entrypoint.sh';'bash'
