#!/bin/bash

# sed -i 's/10.13.132.62/10.13.132.197/' network-config
# sed -i 's/appformix/i-contrail-analytics-vm/' user-data
# sed -i 's/appformix/i-contrail-analytics-vm/' meta-data
# sed -i 's/appformix/i-contrail-analytics-vm/' new-vm.sh

# update ssh_authorized_keys in user-data

# sed -i 's/eth0/ens3/' network-config
# /etc/qemu-kvm/bridge.conf needs to have bridges to use (ex, br-ex)
# /etc/modprobe.d/kvm_intel.conf: options kvm_intel nested=1
# /etc/profile.d/proxy.sh: proxy and no_proxy

set -x

VM_NAME=appformix
VCPUS=8
RAMSIZE=16000
DISKSIZE=100G
BRIDGE1=br-ex
BRIDGE2=br-ctlplane

virsh destroy $VM_NAME
virsh undefine $VM_NAME --remove-all-storage
#sudo rm -f $VM_NAME.qcow2

sudo rm -f init.iso
genisoimage -o init.iso -volid cidata -joliet -rock user-data meta-data network-config

cp ../images/ubuntu-14.04-server-cloudimg-amd64-disk1.img $VM_NAME.qcow2
qemu-img resize $VM_NAME.qcow2 +$DISKSIZE

# --network bridge=$BRIDGE1,mac=$MAC1,model=rtl8139

virt-install \
--virt-type kvm \
--name $VM_NAME  \
--vcpu $VCPUS \
--ram $RAMSIZE \
--disk $VM_NAME.qcow2,format=qcow2 \
--network bridge=$BRIDGE1 \
--network bridge=$BRIDGE2 \
--graphics vnc,listen=0.0.0.0 \
--noautoconsole \
--os-type=linux \
--os-variant=ubuntu14.04 \
--import \
--cpu host \
--disk path=init.iso,device=cdrom

virsh autostart $VM_NAME

