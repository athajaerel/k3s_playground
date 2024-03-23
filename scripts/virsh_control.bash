#!/bin/bash
set -euxo pipefail

/usr/bin/virsh "$1" "$2"
