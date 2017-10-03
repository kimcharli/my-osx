
http://superuser.openstack.org/articles/deploying-openstack-aws-tutorial/
https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/10/html/director_installation_and_usage/chap-requirements





```
[vcpe@server14 ~]$ sudo subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: ckim@juniper.net
Password:
You must first accept Red Hat's Terms and conditions. Please visit https://www.redhat.com/wapps/ugc . You may have to log out of and back into the  Customer Portal in order to see the terms.
```
http://www.redhat.com/wapps/tnc/termsack?event[]=subscriptionActivation
```
[vcpe@server14 ~]$ sudo subscription-manager register
Registering to: subscription.rhsm.redhat.com:443/subscription
Username: ckim@juniper.net
Password:
The system has been registered with ID: cec44a39-0f37-4ab6-b78a-15962bf9e151
[vcpe@server14 ~]$
```


https://access.redhat.com/labs/rhpc/

```
[vcpe@server14 ~]$ sudo -i
[root@server14 ~]# cat << EOF >> /etc/pki/product/328.pem
> -----BEGIN CERTIFICATE-----
> MIIGBDCCA+ygAwIBAgIJALDxRLt/tU49MA0GCSqGSIb3DQEBBQUAMIGuMQswCQYD
> VQQGEwJVUzEXMBUGA1UECAwOTm9ydGggQ2Fyb2xpbmExFjAUBgNVBAoMDVJlZCBI
> YXQsIEluYy4xGDAWBgNVBAsMD1JlZCBIYXQgTmV0d29yazEuMCwGA1UEAwwlUmVk
> IEhhdCBFbnRpdGxlbWVudCBQcm9kdWN0IEF1dGhvcml0eTEkMCIGCSqGSIb3DQEJ
> ARYVY2Etc3VwcG9ydEByZWRoYXQuY29tMB4XDTE3MDMxNTE3MzgzMloXDTM3MDMx
> MDE3MzgzMlowRDFCMEAGA1UEAww5UmVkIEhhdCBQcm9kdWN0IElEIFs1ZDMzM2M3
> ZS1lODE5LTRjYWItODE4OC1mOTliNzgxNWVmN2RdMIICIjANBgkqhkiG9w0BAQEF
> AAOCAg8AMIICCgKCAgEAxj9J04z+Ezdyx1U33kFftLv0ntNS1BSeuhoZLDhs18yk
> sepG7hXXtHh2CMFfLZmTjAyL9i1XsxykQpVQdXTGpUF33C2qBQHB5glYs9+d781x
> 8p8m8zFxbPcW82TIJXbgW3ErVh8vk5qCbG1cCAAHb+DWMq0EAyy1bl/JgAghYNGB
> RvKJObTdCrdpYh02KUqBLkSPZHvo6DUJFN37MXDpVeQq9VtqRjpKLLwuEfXb0Y7I
> 5xEOrR3kYbOaBAWVt3mYZ1t0L/KfY2jVOdU5WFyyB9PhbMdLi1xE801j+GJrwcLa
> xmqvj4UaICRzcPATP86zVM1BBQa+lilkRQes5HyjZzZDiGYudnXhbqmLo/n0cuXo
> QBVVjhzRTMx71Eiiahmiw+U1vGqkHhQNxb13HtN1lcAhUCDrxxeMvrAjYdWpYlpI
> yW3NssPWt1YUHidMBSAJ4KctIf91dyE93aStlxwC/QnyFsZOmcEsBzVCnz9GmWMl
> 1/6XzBS1yDUqByklx0TLH+z/sK9A+O2rZAy1mByCYwVxvbOZhnqGxAuToIS+A81v
> 5hCjsCiOScVB+cil30YBu0cH85RZ0ILNkHdKdrLLWW4wjphK2nBn2g2i3+ztf+nQ
> ED2pQqZ/rhuW79jcyCZl9kXqe1wOdF0Cwah4N6/3LzIXEEKyEJxNqQwtNc2IVE8C
> AwEAAaOBjTCBijAJBgNVHRMEAjAAMC0GDCsGAQQBkggJAYJIAQQdDBtSZWQgSGF0
> IFZpcnR1YWxpemF0aW9uIEhvc3QwFQYMKwYBBAGSCAkBgkgCBAUMAzQuMTAYBgwr
> BgEEAZIICQGCSAMECAwGeDg2XzY0MB0GDCsGAQQBkggJAYJIBAQNDAtyaHZoLHJo
> dmgtNDANBgkqhkiG9w0BAQUFAAOCAgEAxbXqDy9wk0AmpDqom6TDXM9NSd1gracx
> 29x6QRz+XMS5RgC9OP6cwCZG6zhRl3c86EHIpb01re0yKYiPZoo7CTY4iq89qJiM
> OWqvc/kF9TpMssXb2Ux6i58uWoMGcs5dgepZbsDTCBtu2YFjmGqcyywJuYIudCGu
> TsI8d4HSJeuPFqdAO7mSzNsjqAYGdogPvNVwvQVQQAxcuova3+ow/bptSDgnacbg
> S7ZsCv39alCduGUc8e+tXLtCmOZFGtWtZIdA0FSKQbD9PStitQT3NMNUCDnTNTl/
> niLOH1qwGJeYfFHYKPJ/VEhYckTSgYdys9afdSHcJk+lc6urWvmafZU1aRmi9Npu
> VEeehcKE17u3qzlqztcFfizixIM1qKEqHLkrVSAvk66QmF5Iqe4WmefyFJQ88UQ+
> IQPoa88wKAdlNEDY/Xtw+mSoPUevnHjtQB7OAkYM2k4prsdy68V6/Bk5rPjphLH3
> iE81h2pGzr8lLJyZCwE2TfawlDFOTWwUZGc7Adn7qWya9qP6Afgu8zOjYwtApKwF
> v5OU8b/Zcuuqos9JMsA961s1XCQAokn58qKIlC5xyMICLXDyJ5CiklldsQUDqLM3
> T9YvXK4eAkGbCBaI7s7K4y7NPAyrDIAOgIjMotrdm53tU0WqwED5BEEDSCF2g/Y9
> HyjgdCrwh0I=
> -----END CERTIFICATE-----
>
> EOF
[root@server14 ~]# restorecon -Rv /etc/pki/product
rct cat-cert /etc/pki/product/328.pem[root@server14 ~]# chown root.root /etc/pki/product/328.pem
[root@server14 ~]# chmod 644 /etc/pki/product/328.pem
[root@server14 ~]# rct cat-cert /etc/pki/product/328.pem

+-------------------------------------------+
        Product Certificate
+-------------------------------------------+

Certificate:
        Path: /etc/pki/product/328.pem
        Version: 1.0
        Serial: 12750047592154746429
        Start Date: 2017-03-15 17:38:32+00:00
        End Date: 2037-03-10 17:38:32+00:00

Subject:
        CN: Red Hat Product ID [5d333c7e-e819-4cab-8188-f99b7815ef7d]

Issuer:
        C: US
        CN: Red Hat Entitlement Product Authority
        O: Red Hat, Inc.
        OU: Red Hat Network
        ST: North Carolina
        emailAddress: ca-support@redhat.com

Product:
        ID: 328
        Name: Red Hat Virtualization Host
        Version: 4.1
        Arch: x86_64
        Tags: rhvh,rhvh-4
        Brand Type:
        Brand Name:

[root@server14 ~]# subscription-manager register --auto-attach
This system is already registered. Use --force to override
[root@server14 ~]# subscription-manager refresh
All local data refreshed
[root@server14 ~]# subscription-manager identity
system identity: cec44a39-0f37-4ab6-b78a-15962bf9e151
name: server14.vcpe.pslab.juniper.net
org name: 5834717
org ID: 5834717
[root@server14 ~]#
```


yum repolist all

subscription-manager repos --list


sudo yum update

sudo yum install libvirt-client libvirt-daemon qemu-kvm libvirt-daemon-driver-qemu libvirt-daemon-kvm virt-install bridge-utils rsync

sudo yum install lftp virt-manager virt-viewer xauth


sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo usermod -a -G kvm vcpe
sudo usermod -a -G qemu vcpe

```
[vcpe@server14 ~]$ modinfo bridge
filename:       /lib/modules/3.10.0-514.el7.x86_64/kernel/net/bridge/bridge.ko
alias:          rtnl-link-bridge
version:        2.3
license:        GPL
rhelversion:    7.3
srcversion:     FF0448CD85C271287DE1963
depends:        stp,llc
intree:         Y
vermagic:       3.10.0-514.el7.x86_64 SMP mod_unload modversions
signer:         Red Hat Enterprise Linux kernel signing key
sig_key:        75:FE:A1:DF:24:5A:CC:D9:7A:17:FE:3A:36:72:61:E6:5F:8A:1E:60
sig_hashalgo:   sha256
[vcpe@server14 ~]$
```

sudo vi /etc/polkit-1/rules.d/49-polkit-pkla-compat.rules
```

polkit.addRule(function(action, subject) {
    if (action.id == "org.libvirt.unix.manage" &&
        subject.isInGroup("kvm")) {
            return polkit.Result.YES;
        }
});
```


```
[vcpe@server14 ~]$ diff ifcfg-br-ex /etc/sysconfig/network-scripts/ifcfg-eno1
1c1
< TYPE="Bridge"
---
> TYPE="Ethernet"
10,11c10,12
< NAME="br-ex"
< DEVICE="br-ex"
---
> NAME="eno1"
> UUID="01511c35-fdad-4d73-8c4f-5935c7106a62"
> DEVICE="eno1"
20,21d20
< NM_CONTROLLED=no
<
[vcpe@server14 ~]$
```

```
[vcpe@server14 ~]$ cat ifcfg-eno1
TYPE="Ethernet"
BOOTPROTO="none"
NAME="eno1"
DEVICE="eno1"
ONBOOT="yes"
NM_CONTROLLED=no
BRIDGE=br-ex

[vcpe@server14 ~]$ cat ifcfg-br-ctlplane
TYPE="Bridge"
BOOTPROTO="none"
NAME="br-ctlplane"
DEVICE="br-ctlplane"
ONBOOT="yes"
NM_CONTROLLED=no

[vcpe@server14 ~]$ cat ifcfg-eno2
TYPE="Ethernet"
BOOTPROTO="none"
NAME="eno2"
DEVICE="eno2"
ONBOOT="yes"
NM_CONTROLLED=no
BRIDGE=br-ctlplane

[vcpe@server14 ~]$

```


```
[vcpe@server14 ~]$ brctl show
bridge name     bridge id               STP enabled     interfaces
[vcpe@server14 ~]$ sudo systemctl restart network

[vcpe@server14 ~]$
[vcpe@server14 ~]$ brctl show
bridge name     bridge id               STP enabled     interfaces
br-ctlplane             8000.0cc47a84f769       no              eno2
br-ex           8000.0cc47a84f768       no              eno1
[vcpe@server14 ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eno1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master br-ex state UP qlen 1000
    link/ether 0c:c4:7a:84:f7:68 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::ec4:7aff:fe84:f768/64 scope link
       valid_lft forever preferred_lft forever
3: eno2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq master br-ctlplane state UP qlen 1000
    link/ether 0c:c4:7a:84:f7:69 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::ec4:7aff:fe84:f769/64 scope link
       valid_lft forever preferred_lft forever
4: ens7f0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0c:c4:7a:8e:f5:7e brd ff:ff:ff:ff:ff:ff
5: ens7f1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
    link/ether 0c:c4:7a:8e:f5:7f brd ff:ff:ff:ff:ff:ff
8: br-ex: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP qlen 1000
    link/ether 0c:c4:7a:84:f7:68 brd ff:ff:ff:ff:ff:ff
    inet 10.13.132.77/23 brd 10.13.133.255 scope global br-ex
       valid_lft forever preferred_lft forever
    inet6 fe80::ec4:7aff:fe84:f768/64 scope link
       valid_lft forever preferred_lft forever
9: br-ctlplane: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP qlen 1000
    link/ether 0c:c4:7a:84:f7:69 brd ff:ff:ff:ff:ff:ff
    inet6 fe80::ec4:7aff:fe84:f769/64 scope link
       valid_lft forever preferred_lft forever
[vcpe@server14 ~]$

```

sudo cp rhel-server-7.3-x86_64-dvd.iso /var/lib/libvirt/images/



```
xhost +localhost

[vcpe@server14 ~]$ sudo  virt-install --name undercloud --memory=16384 --vcpus=4 --location /var/lib/libvirt/images/rhel-server-7.3-x86_64-dvd.iso --disk size=100 --network bridge=br-ex --network bridge=br-ctlplane --graphics=vnc --hvm --os-variant=rhel7

Starting install...
Retrieving file .treeinfo...                                                                                           | 2.1 kB  00:00:00
Retrieving file vmlinuz...                                                                                             | 5.1 MB  00:00:00
Retrieving file initrd.img...                                                                                          |  43 MB  00:00:00
Allocating 'undercloud.qcow2'                                                                                          | 100 GB  00:00:00
SSH gateway: X11 authentication failed.
(virt-viewer:62304): Gtk-WARNING **: cannot open display: localhost:10.0
Domain installation still in progress. You can reconnect to
the console to complete the installation process.
[vcpe@server14 ~]$
```

















under cloud (director)
- 8 core
- 16 G ram
- 40G disk
- 2 interfaces
- RHEL 7.3
- SE enabled


us-west-2
vpc: rhosp-ckim 10.0.0.0/16
  subnet1: 10.0.0.0/24
  subnet2: 10.0.0.1/24
ami: RHEL-7.3 (Maipo) - ami-5d9d8024
- ami: Red Hat Enterprise Linux 7.4 (HVM), SSD Volume Type - ami-9fa343e7
t2.2xlarge


pm_addr : ipmi
ctlplane

br-ex (eth0)
  ipmi
  external
  dhcp for undercloud
br-ctlplane (eth1)
  connect to overcloud
  service dhcp-pxeboot
  overcloud pxe
  vlan


overcloud
  - provision network
  - external network

compute
- 4 core
- 6 G
- 40 G
- 1 nic





