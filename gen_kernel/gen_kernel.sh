#!/bin/bash

cp -v ./.config /usr/src/linux
cp -v ./font_8x16.c /usr/src/linux/lib/fonts/
cd /usr/src/linux
make menuconfig;
cp -v /usr/src/linux/.config /usr/src/gen_kernel/
make -j9 && make -j9 modules_install;
mv -v /boot/efi/boot/bootx64.efi /boot/efi/boot/bootx64_last.efi
cp -v /usr/src/linux/arch/x86/boot/bzImage /boot/efi/boot/bootx64.efi
make install

#rebuild kernel modules
emerge @module-rebuild
