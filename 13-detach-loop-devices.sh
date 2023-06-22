#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#clean-up-the-chroot-environment
set -e

echo "### 13 Detach loop devices - STARTING"

sudo fsck -f -y -v /dev/loop1p1
sudo fsck -f -y -v /dev/loop1p2
sudo losetup -D

echo "### 13 Detach loop devices - COMPLETE"