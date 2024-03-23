#!/bin/bash
set -euxo pipefail

ACTION="$1"
DOMAIN="$2"
HOSTS='k3s-mother-01 k3s-mother-02 k3s-mother-03 k3s-child-01 k3s-child-02 k3s-child-03 k3s-child-04 k3s-child-05'
for HOST in ${HOSTS}; do
	virsh ${ACTION} ${HOST}.${DOMAIN}
done
