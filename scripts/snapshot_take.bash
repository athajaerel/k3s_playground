#!/bin/bash
set -euxo pipefail

virsh snapshot-create-as "$1" "$2"
