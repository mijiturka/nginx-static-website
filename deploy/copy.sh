#!/bin/bash
set eux pipefail

scp -r ${SITE_NAME}/ ${LINODE_USER}@${LINODE_IP}:/www/
scp nginx/* ${LINODE_USER}@${LINODE_IP}:/home/${LINODE_USER}/setup/
