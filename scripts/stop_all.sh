#!/bin/bash
set -euxo pipefail

DIR="$(dirname $(readlink -f $0))"
DOMAIN='dreamtrack.test'
ACTION='shutdown'

${DIR}/virsh.bash "${ACTION}" "${DOMAIN}"

