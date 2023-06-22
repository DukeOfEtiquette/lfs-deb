#!/bin/sh
set -e

echo "Starting up all.sh..."

./00-prerequisites.sh
./01-create-loop-device.sh
./02-format-partitions-in-loop.sh
./03-mount-loop-devices.sh
./04-bootstrap-config-deb.sh

echo "all.sh FINISHED!"