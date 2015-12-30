#!/usr/local/cpanel/3rdparty/bin/perl

use MIME::Base64;
 
#here's the base64 data for the script

my $base64scriptFileData = <<EOF;
IyEvdXNyL2xvY2FsL2NwYW5lbC8zcmRwYXJ0eS9wZXJsLzUxNC9iaW4vcGVybAp1c2UgRG9tYWlu
U3RhdHVzOwp1c2UgRmlsZTo6U2x1cnAgJ3JlYWRfZmlsZSc7CnVzZSBzdHJpY3Q7CnVzZSB3YXJu
aW5nczsKdXNlIElQQzo6T3BlbjM7Cm91ciAkZmlsZU5hbWUgPSAiL2V0Yy91c2VyZGF0YWRvbWFp
bnMiOwpvdXIgQGxpbmtzICAgID0gcmVhZF9maWxlKCAkZmlsZU5hbWUgKTsKJFRlcm06OkFOU0lD
b2xvcjo6QVVUT1JFU0VUID0gMTsKdXNlIFRlcm06OkFOU0lDb2xvciBxdyg6Y29uc3RhbnRzKTsK
CnN1YiBnZXRfZGF0YSB7CiAgICAkU0lHeydJTlQnfSA9IHN1YiB7IHByaW50ICJDYXVnaHQgQ1RS
TCtDIVxuIiB9OyAgICAjY3VycmVudGx5IG1lYW4sIGJ1dCB3aWxsIG5pY2UgaXQgbGF0ZXIKICAg
IHByaW50ICJcblx0X19fQ2hlY2tpbmcgSFRUUCByZXNwb25zZSBjb2RlcyBhbmQgRE5TIEEgcmVj
b3Jkc19fX1xuXG4iOwogICAgZm9yZWFjaCBteSAkdURvbWFpbiAoIEBsaW5rcyApIHsKICAgICAg
ICBpZiAoICR1RG9tYWluID1+IC8oLiopOltcc10vICkgewogICAgICAgICAgICBvdXIgJHJlc291
cmNlID0gJDE7CiAgICAgICAgICAgIGV2YWwgewogICAgICAgICAgICAgICAgbG9jYWwgKCAqSElT
X09VVCwgKkhJU19FUlIgKTsKICAgICAgICAgICAgICAgIG15ICRjaGlsZHBpZCA9CiAgICAgICAg
ICAgICAgICAgICAgb3BlbjMoIHVuZGVmLCAqSElTX09VVCwgKkhJU19FUlIsIFwmRG9tYWluU3Rh
dHVzOjpfZ2V0X2h0dHBfc3RhdHVzKCAiJHJlc291cmNlIiApLCB1bmRlZiApOwogICAgICAgICAg
ICAgICAgbXkgQG91dGxpbmVzID0gPEhJU19PVVQ+OyAgICAgICAgICAKICAgICAgICAgICAgICAg
IG15IEBlcnJsaW5lcyA9IDxISVNfRVJSPjsgICAgICAgICAgCiAgICAgICAgICAgICAgICBwcmlu
dCAiU1RET1VUOlxuIiwgQG91dGxpbmVzLCAiXG4iOwogICAgICAgICAgICAgICAgcHJpbnQgIlNU
REVSUjpcbiIsIEBlcnJsaW5lcywgIlxuIjsKICAgICAgICAgICAgICAgIGNsb3NlIEhJU19PVVQ7
CiAgICAgICAgICAgICAgICBjbG9zZSBISVNfRVJSOwogICAgICAgICAgICAgICAgd2FpdHBpZCgg
JGNoaWxkcGlkLCAwICk7CiAgICAgICAgICAgICAgICBpZiAoICQ/ICkgewogICAgICAgICAgICAg
ICAgICAgIHByaW50ICJDaGlsZCBleGl0ZWQgd2l0aCB3YWl0IHN0YXR1cyBvZiAkP1xuIjsKICAg
ICAgICAgICAgICAgIH0KICAgICAgICAgICAgfTsKICAgICAgICAgICAgZXZhbCB7CiAgICAgICAg
ICAgICAgICBsb2NhbCAoICpISVNfT1VUMiwgKkhJU19FUlIyICk7CiAgICAgICAgICAgICAgICBt
eSAkY2hpbGRwaWQyID0KICAgICAgICAgICAgICAgICAgICBvcGVuMyggdW5kZWYsICpISVNfT1VU
MiwgKkhJU19FUlIyLCBcJkRvbWFpblN0YXR1czo6X2dldF9kbnNfZGF0YSggIiRyZXNvdXJjZSIg
KSwgdW5kZWYgKTsKICAgICAgICAgICAgICAgIG15IEBvdXRsaW5lczIgPSA8SElTX09VVDI+Owog
ICAgICAgICAgICAgICAgbXkgQGVycmxpbmVzMiA9IDxISVNfRVJSMj47CiAgICAgICAgICAgICAg
ICBwcmludCAiU1RET1VUOlxuIiwgQG91dGxpbmVzMiwgIlxuIjsKICAgICAgICAgICAgICAgIHBy
aW50ICJTVERFUlI6XG4iLCBAZXJybGluZXMyLCAiXG4iOwogICAgICAgICAgICAgICAgY2xvc2Ug
SElTX09VVDI7CiAgICAgICAgICAgICAgICBjbG9zZSBISVNfRVJSMjsKICAgICAgICAgICAgICAg
IHdhaXRwaWQoICRjaGlsZHBpZDIsIDAgKTsKCiAgICAgICAgICAgICAgICBpZiAoICQ/ICkgewog
ICAgICAgICAgICAgICAgICAgIHByaW50ICJDaGlsZCBleGl0ZWQgd2l0aCB3YWl0IHN0YXR1cyBv
ZiAkP1xuIjsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfTsKICAgICAgICB9IGVsc2Ug
ewogICAgICAgICAgICBwcmludCBZRUxMT1cgIlBvc3NpYmxlIGJhZCBEb21haW4gZGF0YSBlbm91
bnRlcmVkLCBtYW51YWxseSBjaGVjayAvZXRjL3VzZXJkYXRhZG9tYWlucyBmaWxlIGFmdGVyIGZp
bmlzaGVkLlxuIjsKICAgICAgICB9CiAgICB9Cn0KCnN1YiBzaG93TWFpbEFjY291bnRzIHsKICAg
IHByaW50ICJcblxuXHRfX19NYWlsIGFjY291bnRzIGZvdW5kOl9fX1xuXG4iOwogICAgJkRvbWFp
blN0YXR1czo6X2dldF9tYWlsX2FjY291bnRzKCk7Cn0KCnN1YiBzdXByZXNzRVJSKCQpIHsKICAg
IG9wZW4gbXkgJHNhdmVvdXQsICI+JlNUREVSUiI7CiAgICBvcGVuIFNUREVSUiwgJz4nLCBGaWxl
OjpTcGVjLT5kZXZudWxsKCk7CiAgICBteSAkZnVuYyA9ICRfWzBdOwogICAgJGZ1bmMtPigpOwog
ICAgb3BlbiBTVERFUlIsICI+JiIsICRzYXZlb3V0Owp9Cgomc3VwcmVzc0VSUiggXCZnZXRfZGF0
YSApOwomc2hvd01haWxBY2NvdW50cygpOwo=
EOF

#here's the base64 data for the module

my $base64modulesFileData = <<EOF;
IyEvdXNyL2xvY2FsL2NwYW5lbC8zcmRwYXJ0eS9wZXJsLzUxNC9iaW4vcGVybAojIGNwYW5lbAkJ
CQkgICAgICAgICAgIENvcHlyaWdodChjKSAyMDE1IGNQYW5lbCwgSW5jLgojICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBbGwgcmlnaHRz
IFJlc2VydmVkLgojIGNvcHlyaWdodEBjcGFuZWwubmV0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBodHRwOi8vY3BhbmVsLm5ldAojIFRoaXMgY29kZSBpcyBzdWJqZWN0
IHRvIHRoZSBjUGFuZWwgbGljZW5zZS4gVW5hdXRob3JpemVkIGNvcHlpbmcgaXMgcHJvaGliaXRl
ZAoKcGFja2FnZSBEb21haW5TdGF0dXM7CnVzZSBzdHJpY3Q7CnVzZSB3YXJuaW5nczsKdXNlIEZp
bGU6OlNsdXJwIHF3KHJlYWRfZmlsZSk7Cm91ciAkVkVSU0lPTiA9IDAuMDI7CgojdGhpcyBpcyBh
IHN1YnJvdXRpbmUgdG8gY2hlY2sgdGhlIGh0dHAgc3RhdHVzIGNvZGUgZm9yIGRvbWFpbnMKc3Vi
IF9nZXRfaHR0cF9zdGF0dXMgewoKICAgICN3ZSB1c2UgbHdwL3RpbWUvYW5zaSBmb3Igb3V0cHV0
L2NvbW1hbmRzCiAgICByZXF1aXJlIExXUDo6VXNlckFnZW50OwogICAgcmVxdWlyZSBUaW1lOjpI
aVJlczsKICAgICRUZXJtOjpBTlNJQ29sb3I6OkFVVE9SRVNFVCA9IDE7CiAgICB1c2UgVGVybTo6
QU5TSUNvbG9yIHF3KDpjb25zdGFudHMpOwoKICAgICNvdXIgVVJMIHNob3VsZCBjb21lIGluIGFz
IGFuIGFyZ3VtZW50IHRvIHRoZSBzdWJyb3V0aW5lCiAgICBteSAkdXJsID0gIkBfIjsKCiAgICAj
d2UgaGF2ZSBhIGJhc2ljIGJyb3dzZXIgYWdlbnQgYW5kIGEgbG93IHRpbWVvdXQgZm9yIG5vdywg
aGVyZSdzIHRoZSByZXF1ZXN0IGZvciB0aGUgVVJMCiAgICBteSAkdWEgPSBMV1A6OlVzZXJBZ2Vu
dC0+bmV3KCBhZ2VudCA9PiAnTW96aWxsYS81LjAnLCB0aW1lb3V0ID0+ICcxJyApOwogICAgbXkg
JHJlcSA9IEhUVFA6OlJlcXVlc3QtPm5ldyggR0VUID0+ICJodHRwOi8vJHVybCIgKTsKICAgIG15
ICRyZXMgPSAkdWEtPnJlcXVlc3QoICRyZXEgKTsKCiAgICAjd2UgY2FuIHBhcnNlIHRoaXMgZm9y
IGdvb2RpZXMvZXJyb3JzCiAgICBteSAkYm9keSA9ICRyZXMtPmRlY29kZWRfY29udGVudDsKCiAg
ICAjdGhpcyBpcyB0aGUgc3RhdHVzIGNvZGUKICAgIG15ICRjb2RlID0gJHJlcy0+Y29kZSgpOwoK
ICAgICN3ZSBjYW4gZWFzaWx5IGNoZWNrIHRoZSBoZWFkZXJzIHRvIGRldGVybWluZSBpZiB3ZSBo
YWQgYSBnb29kIHJlcXVlc3QgYXMgYmVsb3cKICAgIG15ICRoZWFkID0gJHJlcy0+aGVhZGVycygp
LT5hc19zdHJpbmc7CiAgICBwcmludCAkcmVzLT5oZWFkZXIoICJjb250ZW50LXR5cGVcclxuXHJc
biIgKTsKCiAgICAjYmx1ZSBzZWVtcyBsaWtlIGEgZ29vZCBjb2xvciBmb3IgcmVxdWVzdHMgdGhh
dCBwcm9jZXNzKGZvciBub3cpCiAgICBteSAkYmNvZGUgPSAoIEJPTEQgQkxVRSAkY29kZSApOwog
ICAgaWYgKCAkaGVhZCA9fiAvQ2xpZW50LVBlZXI6W1xzXSguKik6KFswLTldLiopLyApIHsKICAg
ICAgICBteSAkaGVhZDIgPSAiJDE6JDIiOwoKICAgICAgICAjaGVyZSdzIHNvbWUgdGVycmlibGUg
Zm9ybWF0dGluZywgbmVlZHMgaW1wcm92ZW1lbnQKICAgICAgICBwcmludGYoICIlLTMwcyBJUD0l
LTE1cyBTdGF0dXM9JXMgICIsICR1cmwsICRoZWFkMiwgJGJjb2RlICk7CiAgICB9IGVsc2UgewoK
ICAgICAgICAjaWYgd2UgZGlkbid0IHNlZSBhIG5vcm1hbCBoZWFkZXIsIGxldCdzIHByaW50IHRo
ZSBjb2RlIHJlZCB3aXRoIHllbGxvdyB3YXJuaW5ncwogICAgICAgIG15ICRyY29kZSA9ICggUkVE
ICRjb2RlICk7CiAgICAgICAgbXkgJGVycm9yID0gQk9MRCBZRUxMT1cgIkVSUk9SOlx0ISEhQ29u
bmVjdCBGYWlsZWQgOiAkdXJsIDogJHJjb2RlISEhICI7CiAgICAgICAgcHJpbnQgIiRlcnJvciI7
CiAgICB9Cn0KCiN0aGlzIGlzIGEgc3Vicm91dGluZSBmb3IgRE5TIGNoZWNrcwpzdWIgX2dldF9k
bnNfZGF0YSB7CgogICAgI0kgZm91bmQgdGhpcyBoZXJlLCBpdCB3b3JrZWQhCiAgICB1c2UgbGli
ICcvdXNyL2xvY2FsL2NwYW5lbC8zcmRwYXJ0eS9wZXJsLzUxNC9saWI2NC9wZXJsNS9jcGFuZWxf
bGliLyc7CiAgICB1c2UgSVBDOjpTeXN0ZW06OlNpbXBsZSBxdyhzeXN0ZW0gY2FwdHVyZSAkRVhJ
VFZBTCk7CgogICAgI2NvbG9ycyBhZ2FpbgogICAgJFRlcm06OkFOU0lDb2xvcjo6QVVUT1JFU0VU
ID0gMTsKICAgIHVzZSBUZXJtOjpBTlNJQ29sb3IgcXcoOmNvbnN0YW50cyk7CgogICAgI2hlcmUg
d2UgY2FuIGdldCB0aGUgZG9tYWluIGFzIGEgcGFyYW1ldGVyIGFuZCBtYWtlIHNvbWUgZGlnIGFy
Z3VtZW50cwogICAgbXkgJGRvbWFpbiAgICAgPSAiQF8iOwogICAgbXkgJGNtZCAgICAgICAgPSAi
ZGlnIjsKICAgIG15IEBsb2NhbEFyZ3MgID0gKCAiXEBsb2NhbGhvc3QiLCAiJGRvbWFpbiIsICJB
IiwgIitzaG9ydCIsICIrdHJpZXM9MSIgKTsKICAgIG15IEBnb29nbGVBcmdzID0gKCAiXEA4Ljgu
OC44IiwgIiRkb21haW4iLCAiQSIsICIrc2hvcnQiLCAiK3RyaWVzPTEiICk7CgogICAgI3NvLCB0
aGlzIHVzZXMgdGhlIGxpYiBmb3VuZCB0byBjYXB0dXJlIHN0ZG91dCBvZiB0aGUgY2FsbGVkIHN5
c3RlbSBjb21tYW5kCiAgICAjZmlyc3Qgd2UgcG9wdWxhdGUgaXQgaW50byBhbiBhcnJheQogICAg
bXkgQGdvb2dsZUROU0EgPSBjYXB0dXJlKCAkY21kLCBAZ29vZ2xlQXJncyApOwoKICAgICN0aGVu
IHdlIHJlZmVyZW5jZSBvdXQgdGhlIGZpcnN0IGVsZW1lbnQgYmVjYXVzZSB3ZSB3YW50IGEgc2lu
Z3VsYXIgcmV0dXJuCiAgICAjdGhlbiB3ZSBkbyB0aGUgc2FtZSBmb3IgbG9jYWxob3N0IHJlcXVl
c3RzCiAgICBteSAkZ29vZ2xlRE5TUiAgICA9IFxAZ29vZ2xlRE5TQTsKICAgIG15ICRnb29nbGVE
TlMgICAgID0gJGdvb2dsZUROU1ItPlswXTsKICAgIG15IEBsb2NhbGhvc3RETlNBID0gY2FwdHVy
ZSggJGNtZCwgQGxvY2FsQXJncyApOwogICAgbXkgJGxvY2FsaG9zdEROU1IgPSBcQGxvY2FsaG9z
dEROU0E7CiAgICBteSAkbG9jYWxob3N0RE5TICA9ICRsb2NhbGhvc3RETlNSLT5bMF07CiAgICBj
aG9tcCggJGdvb2dsZUROUywgJGxvY2FsaG9zdEROUyApOwoKICAgICNpZiB0aGUgcmVxdWVzdCBp
cyBkZWZpbmVkIGJ1dCBkb2Vzbid0IG1hdGNoOgogICAgaWYgKCAoICRsb2NhbGhvc3RETlMgKSAm
JiAoICRsb2NhbGhvc3RETlMgbmUgJGdvb2dsZUROUyApICkgewogICAgICAgIG15ICRJUE0xICAg
ICAgPSBCT0xEIFlFTExPVyAiV0FSTjogTG9jYWwgSVA6IjsKICAgICAgICBteSAkSVBNMiAgICAg
ID0gQk9MRCBZRUxMT1cgIiBkb2Vzbid0IG1hdGNoIHJlbW90ZSBETlMgIjsKICAgICAgICBteSAk
UmxvY2FsSVAgID0gKCBCT0xEIFJFRCAkbG9jYWxob3N0RE5TICk7CiAgICAgICAgbXkgJFJnb29n
bGVJUCA9ICggQk9MRCBSRUQgJGdvb2dsZUROUyApOwogICAgICAgIHByaW50ICIkSVBNMSIgLiAi
JFJsb2NhbElQIiAuICIkSVBNMiIgLiAiJFJnb29nbGVJUFxuIjsKICAgIH0gZWxzZSB7CgogICAg
ICAgICNpZiBpdCdzIGRlZmluZWQgYW5kIG1hdGNoZXMsIHdlIGRvIGEgbm9ybWFsIHRoaW5nOgog
ICAgICAgIGlmICggKCAkbG9jYWxob3N0RE5TICkgJiYgKCAiJGxvY2FsaG9zdEROUyIgZXEgIiRn
b29nbGVETlMiICkgKSB7CiAgICAgICAgICAgIHByaW50ICJETlMgSVA6ICRnb29nbGVETlMgOiAk
ZG9tYWluXG4iOwogICAgICAgIH0gZWxzZSB7CgogICAgICAgICAgICAjZWxzZSBwcmludCB5ZWxs
b3cgd2FybmluZyBpZiBub3RoaW5nIHdhcyByZXR1cm5lZAogICAgICAgICAgICBwcmludCBZRUxM
T1cgIldBUk46IFNvbWV0aGluZyBoYXBwZW5lZCB0byBETlMgcmVxdWVzdHMgZm9yICRkb21haW4s
IGlzIEROUyBzZXQ/XG4iOwogICAgICAgIH0KICAgIH0KfQoKc3ViIF9nZXRfbWFpbF9hY2NvdW50
cyB7CgogICAgI3JlYWQgaW4gdXNlcnMgZnJvbSBwYXNzd2QKICAgIG15IEBwYXNzd2QgPSByZWFk
X2ZpbGUoICIvZXRjL3Bhc3N3ZCIgKTsKICAgIG15ICRkaXIgICAgPSAnL3Zhci9jcGFuZWwvdXNl
cnMnOwogICAgbXkgJXVzZXJfbGlzdDsKCiAgICBvcGVuZGlyKCBESVIsICRkaXIgKSBvciBkaWUg
JCE7CiAgICB3aGlsZSAoIG15ICRmaWxlID0gcmVhZGRpciggRElSICkgKSB7CiAgICAgICAgbmV4
dCBpZiAoICRmaWxlID1+IG0vXlwuLyApOwogICAgICAgIGZvcmVhY2ggbXkgJGxpbmUgKCBAcGFz
c3dkICkgewoKICAgICAgICAgICAgI2lmIHdlIGxvb2sgbGlrZSBhIHN5c3RlbSBhbmQgY3BhbmVs
IHVzZXI/CiAgICAgICAgICAgIGlmICggJGxpbmUgPX4gL14kZmlsZTpbXjpdKjpbXjpdKjpbXjpd
KjpbXjpdKjooW2EtejAtOV9cL10rKTouKi8gKSB7CiAgICAgICAgICAgICAgICAkdXNlcl9saXN0
eyRmaWxlfSA9ICQxOwogICAgICAgICAgICB9CiAgICAgICAgfQogICAgfQogICAgY2xvc2VkaXIo
IERJUiApOwoKICAgICNmb3IgdGhlIHVzZXJzIGZvdW5kLCBpZiB3ZSBhcmVuJ3Qgcm9vdCBsb29r
IGZvciBhbiBldGMgZGlyCiAgICBmb3JlYWNoIG15ICR1c2VyICgga2V5cyAldXNlcl9saXN0ICkg
ewogICAgICAgIGlmICggJHVzZXIgbmUgInJvb3QiICkgewogICAgICAgICAgICBvcGVuZGlyKCBF
VEMsICIkdXNlcl9saXN0eyR1c2VyfS9ldGMiICkgfHwgd2FybiAkISAuICIkdXNlcl9saXN0eyR1
c2VyfS9ldGMiOwogICAgICAgICAgICBteSAkcGF0aCA9ICR1c2VyX2xpc3R7JHVzZXJ9OwoKICAg
ICAgICAgICAgI2ZvciB0aGUgZG9tYWlucyBmb3VuZCBpbiB0aGUgdXNlcnMgZXRjIGRpcgogICAg
ICAgICAgICB3aGlsZSAoIG15ICRkb21haW4gPSByZWFkZGlyKCBFVEMgKSApIHsKICAgICAgICAg
ICAgICAgIG5leHQgaWYgJGRvbWFpbiA9fiAvXlwuLzsgICAjIHNraXAgLiBhbmQgLi4gZGlycwog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzZWUgaWYgd2UgYXJl
IGEgdmFsaWQgZXRjIGRvbWFpbiBhbmQgaWYgc28sIGxvb2sgZm9yIG1haWwgdXNlcnMgYW5kIHBy
aW50CiAgICAgICAgICAgICAgICBpZiAoIC1kICIkcGF0aC9ldGMvJGRvbWFpbi8iICkgewogICAg
ICAgICAgICAgICAgICAgIG9wZW4oIFBBU1NXRCwgIiRwYXRoL2V0Yy8kZG9tYWluL3Bhc3N3ZCIg
KSB8fCBkaWUgJCEgLiAiL2hvbWUvJHVzZXIvZXRjLyRkb21haW4vcGFzc3dkIjsKICAgICAgICAg
ICAgICAgICAgICB3aGlsZSAoIG15ICRQV0xJTkUgPSA8UEFTU1dEPiApIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgJFBXTElORSA9fiBzLzouKi8vOyAgICAjIG9ubHkgc2hvdyBsaW5lIGRhdGEg
YmVmb3JlIGZpcnN0IGNvbG9uICh1c2VybmFtZSBvbmx5KQogICAgICAgICAgICAgICAgICAgICAg
ICBjaG9tcCggJHVzZXIsICRkb21haW4sICRQV0xJTkUgKTsKICAgICAgICAgICAgICAgICAgICAg
ICAgbXkgJFBXTElORUQgPSAiJFBXTElORVxAJGRvbWFpbiI7CiAgICAgICAgICAgICAgICAgICAg
ICAgIGNob21wKCAkUFdMSU5FRCApOwogICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoICJV
c2VyPSUtMTBzIERvbWFpbj0lLTM1cyBFbWFpbD0lc1xuIiwgJHVzZXIsICRkb21haW4sICRQV0xJ
TkVEICk7CiAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgICAgIGNsb3NlKCBQ
QVNTV0QgKTsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQogICAgICAgIH0KICAgICAg
ICBjbG9zZSggRVRDICk7CiAgICB9Cn0KCjEK
EOF


#we need to turn the payload into plain text
my $decodedScript = decode_base64($base64scriptFileData);
my $decodedModule = decode_base64($base64modulesFileData);

#create the module
sub createModule {
      my $modfilename = 'DomainStatus.pm';
      open(my $fh1, '>', $modfilename) or die "Could not open file '$fmodfilename' $!";
      print $fh1 "$decodedModule";
      close $fh1;
}
 
#create the script 
sub createScript {
     my $scriptfilename = 'domainstats.pl';
     open(my $fh2, '>', $scriptfilename) or die "Could not open file '$scriptfilename' $!";
     print $fh2 "$decodedScript";
     close $fh2;
}


#here we see if we already have a script and module from the PWD
sub pmCheck {
    my $workingdir = $ENV{'PWD'};
    my $moduleFile = "$workingdir/DomainStatus.pm";
    my $scriptFile = "$workingdir/domainstats.pl";
 
 #use previous files found or make new ones if none available
     if ( -f $moduleFile ) {
     print "\n$moduleFile exists, using previous module.\n";
    } else {
     &createModule();
     print "\nNo $moduleFile found, created it.\n";
     }
 
    if ( -f $scriptFile ) {
    print "$scriptFile exists, using previous script.\n";
    }  else {
    &createScript();
    print "No $scriptFile found, created it.\n";
    }
}

#wait a second, then execute
sub execScript {
    sleep(1);
    use lib '/usr/local/cpanel/3rdparty/perl/514/lib64/perl5/cpanel_lib/';
    use IPC::System::Simple qw(system capture $EXITVAL);
    system("perl domainstats.pl");
    print "\n";
}

#call our routines
&pmCheck();
&execScript();
