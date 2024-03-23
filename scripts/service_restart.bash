#!/bin/bash
set -euxo pipefail

TRY[0]='/usr/bin/sv'
TRY[1]='/usr/bin/systemctl'

C=0
while [ ! -x ${TRY[C]} ]; do
    C=$(( C + 1 ))
done
${TRY[C]} restart $1
