#!/bin/bash
set -euo pipefail

/usr/local/bin/kubectl describe -n "$1" secret "$2" | awk '/^token:/ {print $2}'
