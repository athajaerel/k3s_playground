#!/bin/bash
set -euxo pipefail

virsh snapshot-delete --current "$1"
