#!/bin/bash

echo "Updating Root CA's from the Alpine Repository"

# Update CA-Certificates Package
apk update --no-cache ca-certificates

# Get custom Certificates
if [ -d "/etc/ssl/certs_custom" ]; then
	echo "Found custom Certificates!"
	
    # Convert from X to .PEM
	for f in /etc/ssl/certs_custom/*.crt
    do
		FILE_PATH=$(basename "$f")
		FILE_EXT="${FILE_PATH##*.}"
		FILE_NAME="${FILE_PATH%.*}"
		
	    openssl x509 -in "$file" -out "/etc/ssl/certs_custom/$FILE_NAME.pem" -outform PEM
    done
fi

# Update CA-Certificates based on the files in /etc/ssl/certs
echo "Generating new ca-certificates.crt file!"
update-ca-certificates
