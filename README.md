First of all, you need to downgrade the firmware of Raspberry Pi 4 to 4.19.
The way is like below:
1. Login Raspberrypi 4 and open a terminal
2. command $ sudo rpi-update e1050e9
The number can be checked in https://github.com/Hexxeh/rpi-firmware/commits for linux kernel 4.19

Reference : https://www.raspberrypi.com/documentation/computers/linux_kernel.html

After that, you need rpi-4.19 git repo. 
$ git clone --depth=1 --branch rpi-4.19.y https://github.com/raspberrypi/linux
$ sudo apt install git bc bison flex libssl-dev make libc6-dev libncurses5-dev
$ sudo apt install crossbuild-essential-armhf

When you uses 64bits please install below things.
$ sudo apt install git bc bison flex libssl-dev make libc6-dev libncurses5-dev
$ sudo apt install crossbuild-essential-arm64


To kernel build, run `01_cross-build.sh`.
To kernel install, run `02_install_sdk.sh`.
