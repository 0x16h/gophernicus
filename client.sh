#!/bin/sh
### openssl s_client -connect localhost:343 -tls1_2
socat TCP4-LISTEN:$1 openssl-connect:localhost:343,cafile=/etc/ssl/cert.pem,method=TLS1.2,verify=0,reuseaddr &
gopher gopher://localhost:$1
