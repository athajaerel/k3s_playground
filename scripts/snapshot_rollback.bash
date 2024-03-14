#!/bin/bash
set -euxo pipefail

virsh snapshot-revert --current --running "$1"
