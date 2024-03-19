#!/bin/bash
set -euxo pipefail

/usr/local/bin/kubectl get node "$1"
