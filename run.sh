#!/bin/sh

# building the buildroot
cd buildroot
rsync -r  ~/Desktop/security/assignment/workspace/tests/* output/target/root/

make -j8

cd ..

# executing the kernel
qemu-system-x86_64 \
-kernel linux-5.11.5/arch/x86_64/boot/bzImage \
-boot c \
-hda buildroot/output/images/rootfs.ext4 \
-append "root=/dev/sda rw console=ttyS0,115200 acpi=off" \
-serial mon:stdio \
-display none \
-m 4G
