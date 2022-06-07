#!/bin/sh
IMAGE_DIR="${0%/*}/"

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

export PATH="/home/manman/buildroot/output/host/bin:${PATH}"
exec   qemu-system-arm -M versatilepb -kernel ${IMAGE_DIR}/zImage -dtb ${IMAGE_DIR}/versatile-pb.dtb -drive file=${IMAGE_DIR}/rootfs.ext2,if=scsi,format=raw -append "rootwait root=/dev/sda console=ttyAMA0,115200"  -net nic,model=rtl8139 -net user  ${EXTRA_ARGS}
