
; START {{ distribution }}
[{{ distribution }}]
method = rsync
fqdn = mirror.lan-quebec.avencall.com
login = root
incoming = /srv/reprepro/incoming/{{ distribution }}
; END {{ distribution }}
