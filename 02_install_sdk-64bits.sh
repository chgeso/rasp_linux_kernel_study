#!/bin/bash

echo "mount sdk filesystem"

#mkdir ../mnt_64bits
#mkdir ../mnt_64bits/fat32
#mkdir ../mnt_64bits/ext4
sudo mount /dev/sdd1 ../mnt_64bits/fat32
sudo mount /dev/sdd2 ../mnt_64bits/ext4

KERNEL=kernel8
KERNEL_TOP_PATH="../"
OUTPUT="$KERNEL_TOP_PATH/out_64bits"
MNT="$KERNEL_TOP_PATH/mnt_64bits"

cd ../rasp_linux_kernel_4.19

sudo make O=$OUTPUT ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- INSTALL_MOD_PATH=$MNT/ext4 modules_install

sudo cp $MNT/fat32/$KERNEL.img $MNT/fat32/$KERNEL-backup.img
sudo cp $OUTPUT/arch/arm64/boot/Image $MNT/fat32/$KERNEL.img
sudo cp $OUTPUT/arch/arm64/boot/dts/broadcom/*.dtb $MNT/fat32/
sudo cp $OUTPUT/arch/arm64/boot/dts/overlays/*.dtb* $MNT/fat32/overlays/
sudo umount $MNT/fat32
sudo umount $MNT/ext4


