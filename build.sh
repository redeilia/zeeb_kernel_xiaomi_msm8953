tput reset
LC_ALL=C date +%Y-%m-%d
date=`date +"%Y%m%d-%H%M"`
BUILD_START=$(date +"%s")
KERNEL_DIR=$PWD
REPACK_DIR=$KERNEL_DIR/AnyKernel3
OUT=$KERNEL_DIR/out
VERSION="v1.0"
export ARCH=arm64 && export SUBARCH=arm64
export CROSS_COMPILE="/home/darkthur/gcc64/bin/aarch64-linux-android-"

rm -rf out
mkdir -p out
make O=out clean
make O=out mrproper
make O=out mido_defconfig
make O=out -j$(nproc --all)

