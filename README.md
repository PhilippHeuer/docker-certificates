# CA Certificate Container for [Docker](https://www.docker.com/)

--------

## A quick note:

This project provides you with an alpine image that keeps your ca-certificates up2date. It also allows you to add custom certificates to use in all of your docker containers, which is useful if you use a registry with a self-signed certificate.

## Quickstart

### Run it

First you need to create a data-only container, which will share you cert-data over all containers.

```
docker create --name cert philippheuer/docker-certificates
```

How to update the RootCA:

```
docker run -it --rm --volumes-from cert philippheuer/docker-certificates ca-update
```

To use custom certificates, you need to mount them at `/etc/ssl/certs_custom/CERTNAME.crt` and it will be appended to the root certificate file by running the `ca-update` script.

```
docker run -it --rm \
  --volumes-from cert \
  --volume /LOCALPATH/file.crt:/etc/ssl/certs_custom/file.crt \
  philippheuer/docker-certificates ca-update
```

### How to use
Now you need to append the following part when you create your containers `--volumes-from cert:ro`. This will mount the `ca-certificates.crt` in read-ony mode.

Example:
```
docker run -it --rm --volumes-from cert:ro alpine sh
```

## License

Released under the [MIT license](./LICENSE).
