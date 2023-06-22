#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#format-the-partitions-in-the-loop-device
set -e

echo "### 02 Format partitions in loop - STARTING"

echo "1. Format the loop0p1 device (/boot)"
sudo mkfs.ext4 -F /dev/loop0p1

echo "2. Format the loop0p2 device (/boot)"
sudo mkfs.ext4 -F /dev/loop0p2

echo "### 02 Format partitions in loop - COMPLETE"