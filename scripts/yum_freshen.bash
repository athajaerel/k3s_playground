#!/bin/bash
set -euxo pipefail

yum clean all
yum -y update
