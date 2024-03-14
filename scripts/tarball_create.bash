#!/bin/bash
set -euxo pipefail

tar cpzf "$1" -C "$2" ${@:3}
