#!/bin/sh
# source: https://mvallim.github.io/kubernetes-under-the-hood/documentation/create-linux-image.html#create-the-loop-device
set -e


# if: read from FILE instead of stdin
# of: write to FILE instead of stdout
# bs: read and write up to BYTES bytes at a time (default: 512); overrides ibs and obs
# count: copy only N input blocks
# seek: skip N obs-sized blocks at start of output
# status: The LEVEL of information to print to stderr;
IF=/dev/zero
OF=$HOME/lfs-deb/debian-image.raw
BS=1
COUNT=0
SEEK=32212254720
STATUS=progress

echo "### 01 Create the loop devices - STARTING"

echo "1. Create an empty virtual hard drive file (30Gb)"
dd \
  if=$IF \
  of=~$OF \
  bs=$BS \
  count=$COUNT \
  seek=$SEEK \
  status=$STATUS

echo "2. Create partitions on the file"
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | sudo fdisk $OF
o # clear the in memory partition table
n # new partition
p # primary partition
1 # partition number 1
    # default - start at beginning of disk
+512M # 512 MB boot parttion
n # new partition
p # primary partition
2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
a # make a partition bootable
1 # bootable partition is partition 1 -- /dev/loop0p1
p # print the in-memory partition table
w # write the partition table
q # and we're done
EOF

echo "3. Start the loop device"
sudo losetup -fP $OF

echo "3.1 Check the status of the loop device"
sudo losetup -a
echo "Expected output: /dev/loop0: [64775]:26084892 ($OF)"

# 4. Check the partitions of the loop device
echo "More details for /dev/loop0"
sudo fdisk -l /dev/loop0

echo "### 01 Create the loop devices - COMPLETE"