#!/bin/bash

echo "mount sdk filesystem"

#mkdir mnt
#mkdir mnt/fat32
#mkdir mnt/ext4
sudo mount /dev/sdd1 mnt/fat32
sudo mount /dev/sdd2 mnt/ext4

KERNEL=kernel7l
KERNEL_TOP_PATH="$( cd "$(dirname "$0")" ; pwd -P)"
OUTPUT="$KERNEL_TOP_PATH/out"
MNT="$KERNEL_TOP_PATH/mnt"

cd linux

sudo make O=$OUTPUT ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=$MNT/ext4 modules_install

sudo cp $MNT/fat32/$KERNEL.img $MNT/fat32/$KERNEL-backup.img
sudo cp $OUTPUT/arch/arm/boot/zImage $MNT/fat32/$KERNEL.img
sudo cp $OUTPUT/arch/arm/boot/dts/overlays/*.dtb* $MNT/fat32/overlays/
sudo umount $MNT/fat32
sudo umount $MNT/ext4


