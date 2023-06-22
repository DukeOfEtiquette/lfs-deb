#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#bootstrap-and-configure-debian
set -e

ARCH=amd64
VARIANT=minbase
COMPONENTS="main"
INCLUDE="ca-certificates,cron,iptables,isc-dhcp-client,libnss-myhostname,ntp,ntpdate,rsyslog,ssh,sudo,dialog,whiptail,man-db,curl,dosfstools,e2fsck-stati"
CODENAME=bookworm
CHROOT_PATH=$HOME/lfs-deb/chroot
URL=http://deb.debian.org/debian/

echo "### 04 Bootstrap & Config Debian - STARTING"

echo "1. Run debootstrap"
sudo debootstrap \
    --arch=$ARCH \
    --variant=$VARIANT \
    --components=$COMPONENTS \
    --include=$INCLUDE \
    $CODENAME \
    $CHROOT_PATH \
    $URL

echo "2. Configure external mount points: $CHROOT_PATH/dev and $CHROOT_PATH/run"
sudo mount --bind /dev $CHROOT_PATH/dev
sudo mount --bind /run $CHROOT_PATH/run

echo "### 04 Bootstrap & Config Debian - COMPLETE"