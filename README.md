#### Gophernicus-TLS

This fork of Gophernicus includes explicit TLS support for OpenBSD.

Building:

    $ make key
    $ make

Install:

    $ doas make key-install
    $ doas make install
    $ doas echo "gopher stream tcp nowait _gophernicus /usr/local/libexec/in.gophernicus in.gophernicus -h localhost" >> /etc/inetd.conf
    $ doas echo "gophers stream tcp nowait _gophernicus /usr/local/libexec/in.gophernicus in.gophernicus-tls -h localhost -p 343 -z 1" >> /etc/inetd.conf

Because there is no IANA-designated port for Gopher over TLS, add 'gophers' to /etc/services:

    gophers     343/tcp

TLS defaults (chown _gophernicus gophernicus* && chmod 600 gophernicus*):

    TLS_CA    "/etc/ssl/cert.pem"
    TLS_CERT  "/etc/ssl/gophernicus.pem"
    TLS_KEY   "/etc/ssl/gophernicus.key"

Run:

    $ doas pkg_add gopher socat
    $ rcctl -f start inetd
    $ ./client.sh 12444

Caveats:

- socat's fork option breaks things; not using fork breaks things - need to add proper TLS support to gopher(1)
