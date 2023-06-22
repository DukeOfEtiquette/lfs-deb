#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#clean-up-the-chroot-environment
set -e

echo "### 12 Umount loop partitions - STARTING"

sudo umount $HOME/lfs-deb/chroot/boot
sudo umount $HOME/lfs-deb/chroot

echo "### 12 Umount loop partitions - COMPLETE"