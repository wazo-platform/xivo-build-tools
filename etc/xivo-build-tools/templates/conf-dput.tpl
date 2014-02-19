
; START {{ distribution }}
[{{ distribution }}]
method = rsync
fqdn = {{ fqdn }}
login = root
incoming = {{ incoming }}/{{ distribution }}
; END {{ distribution }}
