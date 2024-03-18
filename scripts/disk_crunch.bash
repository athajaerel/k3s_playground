#!/bin/bash
set -euxo pipefail

echo "WARNING: this script is most effective when run after disk_vacuum.bash."

# Crunch disks of shutdown hosts. Check disk space!!!

#qemu-img convert -p -c -O qcow2 /home/fatman/libvirt/images/k3s-child-0{0,}1.qcow2
#rm /home/fatman/libvirt/images/k3s-child-001.qcow2
