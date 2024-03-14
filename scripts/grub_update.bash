#!/bin/bash
set -euxo pipefail

if [ -x /usr/bin/update-grub ]; then
    /usr/bin/update-grub
else
    /usr/bin/grub2-mkconfig -o /boot/grub2/grub.cfg
fi
