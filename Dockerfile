############################################################
# Dockerfile
############################################################

# Set the base image
FROM alpine:3.5

# About the Maintainer
MAINTAINER Philipp Heuer <docker@philippheuer.me>

############################################################
# Environment Configuration
############################################################


############################################################
# Package Configuration
############################################################

# Install packages. Notes:
#   * dumb-init: a proper init system for containers, to reap zombie children
#   * ca-certificates: for SSL verification
ENV PACKAGES="\
  dumb-init \
  ca-certificates \
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
	chmod -R +x /etc/periodic &&\
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

# Process Supervisor
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Execution
CMD ["crond -l 2 -f"]
