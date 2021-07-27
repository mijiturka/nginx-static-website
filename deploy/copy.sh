#!/bin/bash
set -eux pipefail

SETUP_DIR="/setup"

ssh ${LINODE_USER}@${LINODE_IP} "mkdir -p ${SETUP_DIR}"

scp deploy/* ${LINODE_USER}@${LINODE_IP}:${SETUP_DIR}/
scp nginx/* ${LINODE_USER}@${LINODE_IP}:${SETUP_DIR}/

scp -r ${SITE_NAME}/ ${LINODE_USER}@${LINODE_IP}:/www/
