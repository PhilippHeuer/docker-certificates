# CA Certificate Container for [Docker](https://www.docker.com/)

--------

## A quick note:

This project provides you with an alpine image that keeps your ca-certificates up2date. It also allows you to add custom certificates to use in all of your docker containers, which is useful if you use a registry with a self-signed certificate.

## Quickstart

### Run it

You can mount your custom certificates to `/etc/ssl/certs_custom/CERTNAME.crt` and it will be appended to the root certificate file.

### How to use in your other containers


## License

Released under the [MIT license](./LICENSE).
