#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#bootstrap-and-configure-debian
set -e

ARCH=amd64
VARIANT=minbase
COMPONENTS="main"
INCLUDE=""
CODENAME=bookworm
CHROOT_PATH=$HOME/lfs-deb/chroot
URL=http://deb.debian.org/debian/

# 1. Run debootstrap
sudo debootstrap \
    --arch=$ARCH \
    --variant=$VARIANT \
    --components=$COMPONENTS \
    --include=$INCLUDE \
    $CODENAME \
    $CHROOT_PATH \
    $URL

# 2. Configure external mount points
sudo mount --bind /dev $CHROOT_PATH/dev
sudo mount --bind /run $CHROOT_PATH/run