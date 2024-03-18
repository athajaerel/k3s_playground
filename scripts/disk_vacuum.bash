#!/bin/bash
set -euxo pipefail

is_in_str() {
    case $2 in
        *$1* ) return 0;;
        *) return 1;;
    esac ;
}

if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root." 1>&2
    exit 1
fi

echo "WARNING: This script will cause the system to halt."

OUTPUT=$(dd if=/dev/zero of=/bigfile 2>&1)

# OUTPUT should contain "No space left on device"
RC=0
if is_in_str "No space left on device" "${OUTPUT}"; then
    sync
else
    echo "Failed to max out root disk." 1>&2
    RC=1
fi

rm /bigfile
sync

if [ ${RC} -eq 0 ]; then
    shutdown -h now
else
    exit ${RC}
fi
