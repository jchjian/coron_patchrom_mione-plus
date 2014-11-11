#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 8081408 ffb8f4cfbc6e6d8aa215b3aeb93944623692e706 5736448 9d3f07e9c8d16f8aa19d6354d78d886166c13ff4
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:8081408:ffb8f4cfbc6e6d8aa215b3aeb93944623692e706; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:5736448:9d3f07e9c8d16f8aa19d6354d78d886166c13ff4 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery ffb8f4cfbc6e6d8aa215b3aeb93944623692e706 8081408 9d3f07e9c8d16f8aa19d6354d78d886166c13ff4:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
