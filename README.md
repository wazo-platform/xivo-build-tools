
Installation
============

Update sources files for APT
----------------------------

    wget http://mirror.wazo.community/wazo_current.key -O - | apt-key add -
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

    xivo-build-tools -p wazo-agentd -s

Build package from sources

    xivo-build-tools -p wazo-agentd -S

Build all packages

    xivo-build-tools -a


Build all packages to mirror <mirror2>

    xivo-build-tools -a -m mirror2


Build all packages to mirror <mirror2> with <unstable> distribution

    xivo-build-tools -a -m mirror2 -d unstable


Build all packages with force rebuild (add -f)

    xivo-build-tools -a -f


Build all xivo packages for distribution <pelican-buster>

    xivo-build-tools -a -d pelican-buster


Build <wazo-agentd> for distribution <my-distribution-to-test> with branch <my-branch-to-test>

    xivo-build-tools -d my-distribution-to-test -b my-branch-to-test -p wazo-agentd


Same command with force rebuild (add -f)

    xivo-build-tools -d my-distribution-to-test -b my-branch-to-test -p wazo-agentd -f


Build wazo-auth package for pelican-buster distribution

    xivo-build-tools -d pelican-buster -p wazo-auth


Build wazo-agentd package for test distribution, force rebuild and force xivo-version

    xivo-build-tools -d test -f -v 13.11 -p wazo-agentd


Build all packages for test distribution, force rebuild and force xivo-version

    xivo-build-tools -d test -a -f -v 13.11
