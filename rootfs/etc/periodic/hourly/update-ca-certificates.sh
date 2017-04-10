#!/bin/bash

# Update CA-Certificates Package
apk update --no-cache ca-certificates

# Get custom Certificates


# Update CA-Certificates based on the files in /etc/ssl/certs
update-ca-certificates
