#!/bin/bash
set -euxo pipefail

/usr/bin/tar cpzf "$1" -C "$2" ${@:3}
