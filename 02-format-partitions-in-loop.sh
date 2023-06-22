#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#format-the-partitions-in-the-loop-device
set -e

# 1. Format the loop0p1 device (/boot)
sudo mkfs.ext4 /dev/loop0p1

# 2. Format the loop0p2 device (/boot)
sudo mkfs.ext4 /dev/loop0p2