#!/bin/bash

# Clean up apt-get
apt-get autoremove -y --purge
apt-get clean -y
apt-get purge

# Remove /tmp/
rm -rf /tmp/*

# Shamelss copy of the bento cleanup script, found here:
# https://github.com/opscode/bento/blob/master/packer/scripts/common/minimize.sh

# Whiteout the swap partition to reduce box size
# Swap is disabled till reboot
readonly swapuuid=$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)
readonly swappart=$(readlink -f /dev/disk/by-uuid/"$swapuuid")
/sbin/swapoff "$swappart"
dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed"
/sbin/mkswap -U "$swapuuid" "$swappart"

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
