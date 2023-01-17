#!/bin/bash

echo "configure build output path"

KERNEL_TOP_PATH="../"
OUTPUT="$KERNEL_TOP_PATH/out_64bits"
echo "$OUTPUT"

KERNEL=kernel8
BUILD_LOG="$KERNEL_TOP_PATH/rpi_build_log_64bits.txt"

echo "move kernel source"
cd ../rasp_linux_kernel_4.19

echo "make defconfig"
make O=$OUTPUT ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig

echo "kernel build"
make O=$OUTPUT ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs -j4 2>&1 | tee $BUILD_LOG


