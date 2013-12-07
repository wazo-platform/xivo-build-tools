
Installation
============

Update sources files for APT
----------------------------

   In your /etc/apt/source.list.d/xivo-dev-tools.list:

$ cat >/etc/apt/source.list.d/xivo-dev-tools.list <<EOL
deb http://mirror.lan-quebec.avencall.com/ xivo-dev-tools main
deb-src http://mirror.lan-quebec.avencall.com/ xivo-dev-tools main
EOL

$ wget http://mirror.lan-quebec.avencall.com/key.asc -O - | apt-key add -

$ apt-get update

$ apt-get install xivo-build-tools


Initialisation
--------------

$ su -l builder

$ xivo-build-tools -i

$ ll ~/packages


Examples
========

Package initialization for the first time, can be used later 
to refresh the package and put them all to date.

 $ xivo-build-tools -i


Initialize or update only xivo-agid package

 $ xivo-build-tools -i -p xivo-agid
 

Build all packages

 $ xivo-build-tools -a
 

Build all packages with force rebuild (add -f)

 $ xivo-build-tools -a -f
 

Build all xivo packages for distribution <wheezy-xivo-skaro-dev>

 $ xivo-build-tools -a -d wheezy-xivo-skaro-dev
 

Build <xivo-agent> for distribution <wheezy-xivo-skaro-dev> with branch <wheezy>

 $ xivo-build-tools -d wheezy-xivo-skaro-dev -b wheezy -p xivo-agent
 

Same command with force rebuild (add -f)

 $ xivo-build-tools -d wheezy-xivo-skaro-dev -b wheezy -p xivo-agent -f


Build xivo-web-interface package for squeeze-xivo-skaro-dev distribution

 $ xivo-build-tools -d squeeze-xivo-skaro-dev -p xivo-web-interface


Build xivo-agent package for test distribution, force rebuild and force xivo-version

 $ xivo-build-tools -d test -f -v 13.11 -p xivo-agent


Build all packages for test distribution, force rebuild and force xivo-version

 $ xivo-build-tools -d test -a -f -v 13.11
