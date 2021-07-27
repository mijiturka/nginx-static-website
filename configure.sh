#!/bin/bash

set -eux pipefail

sed -i "s/{{SITE_NAME}}/${SITE_NAME}/g" settings.conf
cp settings.conf /etc/nginx/sites-enabled/app
rm /etc/nginx/sites-enabled/default
