#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#clean-up-the-chroot-environment
set -e

echo "### 10 Clean up chroot env - STARTING"

echo "If you installed software, be sure to run"
# truncate -s 0 /etc/machine-id

echo "2. Remove the diversion"
# rm /sbin/initctl

echo "### 00 Prerequisites - COMPLETE"