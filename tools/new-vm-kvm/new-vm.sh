#!/bin/bash

set -x

VM_NAME=appformix
VCPUS=8
RAMSIZE=16000
DISKSIZE=100G

virsh destroy $VM_NAME
virsh undefine $VM_NAME --remove-all-storage
#sudo rm -f $VM_NAME.qcow2

sudo rm -f init.iso
genisoimage -o init.iso -volid cidata -joliet -rock user-data meta-data

cp ../images/ubuntu-14.04-server-cloudimg-amd64-disk1.img $VM_NAME.qcow2
qemu-img resize $VM_NAME.qcow2 +$DISKSIZE

virt-install \
--virt-type kvm \
--name $VM_NAME  \
--vcpu $VCPUS \
--ram $RAMSIZE \
--disk $VM_NAME.qcow2,format=qcow2 \
--network bridge=br0 \
--graphics vnc,listen=0.0.0.0 \
--noautoconsole \
--os-type=linux \
--os-variant=ubuntu14.04 \
--import \
--disk path=init.iso,device=cdrom


