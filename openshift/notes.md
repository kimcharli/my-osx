
## install OpenShift Online for Mac/OS X

sudo gem install rhc



brew install azure-cli

```
Your cloud drive has been created in:

Subscription Id: 5c03deb9-2357-4d33-b35a-070a04589c5b
Resource group:  cloud-shell-storage-westus
Storage account: cs45c03deb92357x4d33xb35
File share:      cs-ckim-juniper-net-1003bffda60bf8eb

Initializing your account for Cloud Shell...-
Requesting a Cloud Shell.Succeeded.
Connecting terminal...

Welcome to Azure Cloud Shell

Type "az" to use Azure CLI 2.0
Type "help" to learn about Cloud Shell

ckim@Azure:~$
```


```
[0021][ckim@ckim-mbp:~]$ az login
To sign in, use a web browser to open the page https://aka.ms/devicelogin and enter the code BPUYGNT7J to authenticate.
[
  {
    "cloudName": "AzureCloud",
    "id": "34d349b5-4bb0-4ed1-a768-93539036c2e6",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "bea78b3c-4cdb-4130-854a-1d193232e5f4",
    "user": {
      "name": "ckim@juniper.net",
      "type": "user"
    }
  },
  {
    "cloudName": "AzureCloud",
    "id": "5c03deb9-2357-4d33-b35a-070a04589c5b",
    "isDefault": false,
    "name": "Pay-As-You-Go",
    "state": "Enabled",
    "tenantId": "c4a417b5-42a5-4966-862a-0c752719ea49",
    "user": {
      "name": "ckim@juniper.net",
      "type": "user"
    }
  }
]
[0022][ckim@ckim-mbp:~]$
[0022][ckim@ckim-mbp:~]$ az account list
[
  {
    "cloudName": "AzureCloud",
    "id": "34d349b5-4bb0-4ed1-a768-93539036c2e6",
    "isDefault": true,
    "name": "Free Trial",
    "state": "Enabled",
    "tenantId": "bea78b3c-4cdb-4130-854a-1d193232e5f4",
    "user": {
      "name": "ckim@juniper.net",
      "type": "user"
    }
  },
  {
    "cloudName": "AzureCloud",
    "id": "5c03deb9-2357-4d33-b35a-070a04589c5b",
    "isDefault": false,
    "name": "Pay-As-You-Go",
    "state": "Enabled",
    "tenantId": "c4a417b5-42a5-4966-862a-0c752719ea49",
    "user": {
      "name": "ckim@juniper.net",
      "type": "user"
    }
  }
]
[0023][ckim@ckim-mbp:~]$
[0029][ckim@ckim-mbp:~]$ az account set --subscription 5c03deb9-2357-4d33-b35a-070a04589c5b
[0029][ckim@ckim-mbp:~]$ az account show
{
  "environmentName": "AzureCloud",
  "id": "5c03deb9-2357-4d33-b35a-070a04589c5b",
  "isDefault": true,
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantId": "c4a417b5-42a5-4966-862a-0c752719ea49",
  "user": {
    "name": "ckim@juniper.net",
    "type": "user"
  }
}
[0030][ckim@ckim-mbp:~]$
[0030][ckim@ckim-mbp:~]$ az vm list | python -c "import sys, json ; print len(json.load(sys.stdin))"
17
[0031][ckim@ckim-mbp:~]$ az vm list | python -c "import sys, json ; print [ x['name'] for x in json.load(sys.stdin) ]"
[u'Host2', u'Host1', u'Host3', u'vmx1', u'vmx1gen', u'vsrx-pr1', u'abdulh-centos1', u'abdulh-centos2', u'abdulh-westus2-vsrx', u'sai-ubuntu-c', u'saipr-ubuntu-d', u'saipr-ubuntu1-a', u'saipr-ubuntu1-b', u'saipr-vsrx-a', u'vSRX-D4', u'skondi-u1', u'pabbott-test1']
[0032][ckim@ckim-mbp:~]$
[0034][ckim@ckim-mbp:~]$ az vm list | python -c "import sys, json ; print '\n'.join([ x['name'] for x in json.load(sys.stdin) ])"
Host2
Host1
Host3
vmx1
vmx1gen
vsrx-pr1
abdulh-centos1
abdulh-centos2
abdulh-westus2-vsrx
sai-ubuntu-c
saipr-ubuntu-d
saipr-ubuntu1-a
saipr-ubuntu1-b
saipr-vsrx-a
vSRX-D4
skondi-u1
pabbott-test1
[0035][ckim@ckim-mbp:~]$
[0035][ckim@ckim-mbp:~]$ az group list | python -c "import sys,json; print '\n'.join([ x['name'] for x in json.load(sys.stdin)])"
abdulh
cloud-shell-storage-eastus
cloud-shell-storage-westus
d4TryAbdul
JuniperTeam
pabbott-RG1
RG-VSRX2
RG-VSRX3
sai_ipsec_topo1
saipr_ds
saipr_ds3
template_saipr
test1
test_temp
vmx1
vmx2
vmxaz
vnet-demo
vSRX-Dev
vSRX-SNP
[0037][ckim@ckim-mbp:~]$

```










