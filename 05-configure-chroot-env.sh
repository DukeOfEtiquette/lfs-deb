#!/bin/sh
set -e


echo "### 05 Configure chroot env - STARTING"

echo "1. Configure the mount points, home, and locale"
mount none -t proc /proc
mount none -t sysfs /sys
mount none -t devpts /dev/pts

export HOME=/root
export LC_ALL=C

echo "2. Set a custom hostname"
echo "debian-image" > /etc/hostname

echo "3. Configure apt sources.list"
cat <<EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian/ bookworm main contrib non-free
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free

deb http://deb.debian.org/debian/ bookworm-updates main contrib non-free
deb-src http://deb.debian.org/debian/ bookworm-updates main contrib non-free

deb http://deb.debian.org/debian-security bookworm-security main
deb-src http://deb.debian.org/debian-security bookworm-security main
EOF

echo "4. Configure fstab"
cat <<EOF > /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system>         <mount point>   <type>  <options>                       <dump>  <pass>
/dev/sda2               /               ext4    errors=remount-ro               0       1
/dev/sda1               /boot           ext4    defaults                        0       2
EOF

echo "5. Update the apt packages indexes"
apt-get update

echo "6. Install systemd"
apt-get install -y systemd-sysv

echo "7. Configure machine-id and divert"
dbus-uuidgen > /etc/machine-id
ln -fs /etc/machine-id /var/lib/dbus/machine-id

echo "8. Install the packages needed for the system"
apt-get install -y \
    os-prober \
    ifupdown \
    network-manager \
    resolvconf \
    locales \
    build-essential \
    module-assistant \
    cloud-init \
    grub-pc \
    grub2 \
    linux-image-amd64 \
    linux-headers-amd64

echo "### 05 Configure chroot env - COMPLETE"