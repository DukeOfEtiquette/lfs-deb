#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#mount-the-loop-devices
set -e

CHROOT_PATH=$HOME/lfs-dev/chroot
ROOT_MOUNT=/dev/loop0p2
BOOT_PATH=$CHROOT_PATH/boot
BOOT_MOUNT=/dev/loop0p1

echo "### 03 Mount loop devices - STARTING"

echo "1. Create the chroot directory: $CHROOT_PATH"
mkdir $CHROOT_PATH

echo "2. Mount the root partition at $ROOT_MOUNT"
sudo mount $ROOT_MOUNT $CHROOT_PATH

echo "3. Create the boot directory: $BOOT_PATH"
mkdir $BOOT_PATH

echo "4. Mount the boot partition at $BOOT_MOUNT"
sudo mount $BOOT_MOUNT $BOOT_PATH

echo "### 03 Mount loop devices - COMPLETE"