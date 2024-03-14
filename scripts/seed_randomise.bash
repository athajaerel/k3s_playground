#!/bin/bash
set -euxo pipefail

# /dev/urandom is guaranteed to return at least one byte
# but can't guarantee more. By getting one at a time we
# guarantee to get our full 4K.
dd bs=1 count=$1 if=/dev/urandom of=/var/lib/random-seed
