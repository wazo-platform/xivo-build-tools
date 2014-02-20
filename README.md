
Installation
============

Update sources files for APT
----------------------------

 $ wget http://mirror.lan-quebec.avencall.com/key.asc -O - | apt-key add -

 $ echo 'deb http://mirror.lan-quebec.avencall.com/ xivo-dev-tools main' >/etc/apt/sources.list.d/xivo-dev-tools.list

 $ echo 'deb http://ftp.ca.debian.org/debian/ wheezy-backports main' >/etc/apt/sources.list.d/wheezy-backports.list
 
 $ apt-get update

 $ apt-get install xivo-build-tools


Examples
========


Build all packages

 $ xivo-build-tools -a


Build all packages to mirror <mirror2>

 $ xivo-build-tools -a -m mirror2


Build all packages to mirror <mirror2> with <unstable> distribution

 $ xivo-build-tools -a -m mirror2 -d unstable
 

Build all packages with force rebuild (add -f)

 $ xivo-build-tools -a -f
 

Build all xivo packages for distribution <xivo-five>

 $ xivo-build-tools -a -d xivo-five
 

Build <xivo-agent> for distribution <my-distribution-to-test> with branch <my-branch-to-test>

 $ xivo-build-tools -d my-distribution-to-test -b my-branch-to-test -p xivo-agent
 

Same command with force rebuild (add -f)

 $ xivo-build-tools -d my-distribution-to-test -b wheezy -p xivo-agent -f


Build xivo-web-interface package for xivo-five distribution

 $ xivo-build-tools -d xivo-five -p xivo-web-interface


Build xivo-agent package for test distribution, force rebuild and force xivo-version

 $ xivo-build-tools -d test -f -v 13.11 -p xivo-agent


Build all packages for test distribution, force rebuild and force xivo-version

 $ xivo-build-tools -d test -a -f -v 13.11
