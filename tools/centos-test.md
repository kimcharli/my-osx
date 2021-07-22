
## Centos 7 RDP and VNC setup

```
sudo yum install epel-release
sudo yum groupinstall "GNOME Desktop"
sudo yum install tigervnc-server xrdp
sudo systemctl enable vncserver@:1.service
#sudo systemctl daemon-reload

sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
sudo vi /etc/systemd/system/vncserver@:1.service
 substitue <USER> with user name (centos for example)
sudo echo "X-GNOME-Autostart-enabled=false" >> /etc/xdg/autostart/gnome-software-service.desktop

#sudo firewall-cmd --permanent --zone=public --add-service vnc-server
#sudo firewall-cmd --reload
```

```
[centos@ip-10-17-0-249 ~]$ vncserver

You will require a password to access your desktops.

Password:
Verify:
xauth:  file /home/centos/.Xauthority does not exist

New 'ip-10-17-0-249:1 (centos)' desktop is ip-10-17-0-249:1

Creating default startup script /home/centos/.vnc/xstartup
Starting applications specified in /home/centos/.vnc/xstartup
Log file is /home/centos/.vnc/ip-10-17-0-249:1.log

[centos@ip-10-17-0-249 ~]$
```


vnc://13.59.42.91:5901

```
sudo chcon --type=bin_t /usr/sbin/xrdp
sudo chcon --type=bin_t /usr/sbin/xrdp-sesman
sudo systemctl start xrdp.service
```

enable Password SSH
set password

Then RDP






### azure cli example

npm -g install azure-cli -g

```
ckim-mbp:Downloads ckim$ azure login
Microsoft Azure CLI would like to collect data about how users use CLI
commands and some problems they encounter.  Microsoft uses this information
to improve our CLI commands.  Participation is voluntary and when you
choose to participate your device automatically sends information to
Microsoft about how you use Azure CLI.

If you choose to participate, you can stop at any time later by using Azure
CLI as follows:
1.  Use the azure telemetry command to turn the feature Off.
To disable data collection, execute: azure telemetry --disable

If you choose to not participate, you can enable at any time later by using
Azure CLI as follows:
1.  Use the azure telemetry command to turn the feature On.
To enable data collection, execute: azure telemetry --enable

Select y to enable data collection :(y/n) n

You choose not to participate in Microsoft Azure CLI data collection.


info:    Executing command login
/info:    To sign in, use a web browser to open the page https://aka.ms/devicelogin and enter the code BEFWENNC6 to authenticate.
/
|info:    Added subscription Free Trial
info:    Setting subscription "Free Trial" as default
+
info:    login command OK
ckim-mbp:Downloads ckim$
ckim-mbp:Downloads ckim$ azure config mode arm
info:    Executing command config mode
info:    New mode is arm
info:    config mode command OK
ckim-mbp:Downloads ckim$
ckim-mbp:Downloads ckim$ azure group create group1-from-cli eastus
info:    Executing command group create
+ Getting resource group group1-from-cli
+ Creating resource group group1-from-cli
info:    Created resource group group1-from-cli
data:    Id:                  /subscriptions/1f055b48-9122-4286-90bb-c01b9cf7b135/resourceGroups/group1-from-cli
data:    Name:                group1-from-cli
data:    Location:            eastus
data:    Provisioning State:  Succeeded
data:    Tags: null
data:
info:    group create command OK
ckim-mbp:Downloads ckim$


ckim-mbp:Downloads ckim$ azure vm quick-create
info:    Executing command vm quick-create
Resource group name:  group1-from-cli
Virtual machine name:   vm1-from-cli
Location name:  eastus
Operating system Type [Windows, Linux]:  Linux
ImageURN (in the format of "publisherName:offer:skus:version") or a VHD link to the user image:  Canonical:ubuntuserver:16.04-LTS:latest
User name:  ckim
Password: ********
Confirm password: ********
+ Listing virtual machine sizes available in the location "eastus"
+ Looking up the VM " vm1-from-cli"
info:    Using the VM Size "Standard_DS1"
info:    The [OS, Data] Disk or image configuration requires storage account
+ Looking up the storage account stovgy5jxex6r
info:    Could not find the storage account "stovgy5jxex6r", trying to create new one
+ Creating storage account "stovgy5jxex6r" in "eastus"
+ Looking up the storage account stovgy5jxex6r
+ Looking up the NIC "vm1-f-eastu-a8oznwifr7-nic"
info:    An nic with given name "vm1-f-eastu-a8oznwifr7-nic" not found, creating a new one
+ Looking up the virtual network "vm1-f-eastu-a8oznwifr7-vnet"
info:    Preparing to create new virtual network and subnet
| Creating a new virtual network "vm1-f-eastu-a8oznwifr7-vnet" [address prefix: "10.0.0.0/16"] with subnet "vm1-f-eastu-a8oznwifr7-snet"+[address prefix: "10.0.1.0/24"]
+ Looking up the virtual network "vm1-f-eastu-a8oznwifr7-vnet"
+ Looking up the subnet "vm1-f-eastu-a8oznwifr7-snet" under the virtual network "vm1-f-eastu-a8oznwifr7-vnet"
info:    Found public ip parameters, trying to setup PublicIP profile
+ Looking up the public ip "vm1-f-eastu-a8oznwifr7-pip"
info:    PublicIP with given name "vm1-f-eastu-a8oznwifr7-pip" not found, creating a new one
+ Creating public ip "vm1-f-eastu-a8oznwifr7-pip"
+ Looking up the public ip "vm1-f-eastu-a8oznwifr7-pip"
+ Creating NIC "vm1-f-eastu-a8oznwifr7-nic"
+ Looking up the NIC "vm1-f-eastu-a8oznwifr7-nic"
error:   clisto1880421492 vm1from is not a valid storage account name. Storage account name must be between 3 and 24 characters in length and use numbers and lower-case letters only.
error:   Error information has been recorded to /Users/ckim/.azure/azure.err
error:   vm quick-create command failed

ckim-mbp:Downloads ckim$

```