FROM debian:bullseye

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/builder

# NOTE: Python 2 dependencies are kept to rebuild packaging by only changing
#       base image (stretch, buster)
#       Can be removed on wazo-28.01
RUN true && \
    apt-get -yqq update && \
    apt-get -yqq install \
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
        rsync \
        sudo \
        wget

RUN true && \
    useradd --groups sudo --shell /bin/bash --uid 1000 --create-home builder && \
    install --directory --owner builder /home/builder/packages && \
    echo 'builder ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/builder && \
    chmod 440 /etc/sudoers.d/builder && \
    true

ADD etc/xivo-build-tools/ /etc/xivo-build-tools/
ADD bin/xivo-build-tools /usr/bin/
