
Installation
============

Update sources files for APT
----------------------------

    wget http://mirror.wazo.community/xivo_current.key -O - | apt-key add -
    echo 'deb http://mirror.wazo.community/debian/ xivo-dev-tools main' >/etc/apt/sources.list.d/xivo-dev-tools.list
    apt-get update
    apt-get install xivo-build-tools

Docker
======

To run with docker.

    docker build -t xivo-build-tools .
    docker run --user builder \
            -v YOUR_SSH_DIR/.ssh/:/home/builder/.ssh \
            -v YOUR_CONFIG_DIR/mirror:/etc/xivo-build-tools/mirror \
            -v XIVO_GPG_DIR/xivo-keys/gpg/builder/:/tmp/gpg \
            -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
            -e SSH_AUTH_SOCK=/ssh-agent -it xivo-build-tools

By default the uid of the builder user is 1000. Check the right on your machine
for the ssh key.

Examples
========

Build source packages

    xivo-build-tools -p xivo-agentd -s

Build package from sources

    xivo-build-tools -p xivo-agentd -S

Build all packages

    xivo-build-tools -a


Build all packages to mirror <mirror2>

    xivo-build-tools -a -m mirror2


Build all packages to mirror <mirror2> with <unstable> distribution

    xivo-build-tools -a -m mirror2 -d unstable


Build all packages with force rebuild (add -f)

    xivo-build-tools -a -f


Build all xivo packages for distribution <xivo-five>

    xivo-build-tools -a -d xivo-five


Build <xivo-agentd> for distribution <my-distribution-to-test> with branch <my-branch-to-test>

    xivo-build-tools -d my-distribution-to-test -b my-branch-to-test -p xivo-agentd


Same command with force rebuild (add -f)

    xivo-build-tools -d my-distribution-to-test -b my-branch-to-test -p xivo-agentd -f


Build xivo-web-interface package for xivo-five distribution

    xivo-build-tools -d xivo-five -p xivo-web-interface


Build xivo-agentd package for test distribution, force rebuild and force xivo-version

    xivo-build-tools -d test -f -v 13.11 -p xivo-agentd


Build all packages for test distribution, force rebuild and force xivo-version

    xivo-build-tools -d test -a -f -v 13.11
