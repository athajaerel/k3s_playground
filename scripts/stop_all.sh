#!/bin/bash
set -euxo pipefail

virsh shutdown k3s-mother-001.dreamtrack.test
virsh shutdown k3s-child-001.dreamtrack.test
virsh shutdown k3s-child-002.dreamtrack.test
