#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#mount-the-loop-devices
set -e

CHROOT_PATH=$HOME/lfs-dev/chroot
ROOT_MOUNT=/dev/loop0p2
BOOT_PATH=$CHROOT_PATH/boot
BOOT_MOUNT=/dev/loop0p1

# 1. Create the chroot directory
mkdir $CHROOT_PATH

# 2. Mount the root partition
sudo mount $ROOT_MOUNT $CHROOT_PATH

# 3. Create the boot directory
mkdir $BOOT_PATH

# 4. Mount the boot partition
sudo mount $BOOT_MOUNT $BOOT_PATH