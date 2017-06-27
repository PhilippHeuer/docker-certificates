############################################################
# Dockerfile
############################################################

# Set the base image
FROM alpine:3.6

# About the Maintainer
MAINTAINER Philipp Heuer <docker@philippheuer.me>

############################################################
# Environment Configuration
############################################################


############################################################
# Package Configuration
############################################################

# Install packages. Notes:
#   * ca-certificates: ca root certificates
#   * openssl: to convert cert files
ENV PACKAGES="\
  ca-certificates \
  openssl \
"

############################################################
# Installation
############################################################

# Copy files from rootfs to the container
ADD rootfs /

# Build
RUN echo "Starting the build ..." &&\
	###
	# File Permissions
	###
	chmod +x /usr/local/bin/* &&\
	###
	# Build Image
	###
	# Update Package List
	apk add --update &&\
	# Package Install
	apk add --no-cache $PACKAGES &&\
	###
	# CleanUp
	###
	rm -rf /var/cache/apk/*
	
############################################################
# Execution
############################################################

# Volumes
VOLUME ["/etc/ssl/certs"]

# Execution
CMD ["/bin/true"]
