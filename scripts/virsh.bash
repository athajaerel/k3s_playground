#!/bin/bash
set -euxo pipefail

ACTION="$1"
DOMAIN="$2"
HOSTS='k3s-mother-001 k3s-mother-002 k3s-mother-003 k3s-child-001 k3s-child-002 rancher-admin'
for HOST in ${HOSTS}; do
	virsh ${ACTION} ${HOST}.${DOMAIN}
done

