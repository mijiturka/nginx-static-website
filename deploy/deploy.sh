#!/bin/bash

set -eux pipefail

apt-get -y update && apt-get -y upgrade
apt-get -y install nginx
# Not required, but convenient to have
apt-get -y install curl

# Configure NGINX
pushd /setup
/bin/bash configure.sh

service nginx reload
popd
