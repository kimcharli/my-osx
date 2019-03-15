#bin/bash

set -x

# in ks.cfg set user contrail and sshkey
#  update network

VMNAME=centos-iso

grep -q "allow br0" /etc/qemu-kvm/bridge.conf || echo "allow br0" | tee -a /etc/qemu-kvm/bridge.conf

virsh destroy $VMNAME
virsh undefine $VMNAME --remove-all-storage


#--initrd-inject ks.cfg \
#--extra-args "console=tty0 console=ttyS0,115200n8"  \
#--extra-args "ks=file:/ks.cfg  console=tty0 console=ttyS0,115200n8"  \

virt-install --name $VMNAME \
--memory 2048 \
--vcpus 2 \
--metadata description=shard0_vm \
--location /home/contrail/images/CentOS-7-x86_64-DVD-1804.iso \
--os-variant rhel7.5 \
--disk size=20 \
--initrd-inject ks.cfg \
--extra-args "ks=file:/ks.cfg  console=tty0 console=ttyS0,115200n8"  \
--network bridge=br0 --nographics

