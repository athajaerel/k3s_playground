#!/bin/bash
set -euxo pipefail

chsh -s "$1" "$2"
