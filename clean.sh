#!/bin/sh
set -e

echo "Starting clean.sh..."

# ./10-clean-up-chroot.sh
./11-unbind-mount-points.sh
./12-umount-loop-partitions.sh
./13-detach-loop-devices.sh

echo "clean.sh FINISHED!"