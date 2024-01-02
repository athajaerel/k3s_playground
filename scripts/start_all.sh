#!/bin/bash
set -euxo pipefail

DIR="$(dirname $(readlink -f $0))"
DOMAIN='dreamtrack.test'
ACTION='start'

${DIR}/virsh.bash "${ACTION}" "${DOMAIN}"

