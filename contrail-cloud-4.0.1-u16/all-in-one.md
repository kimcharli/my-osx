
from sm

ubuntu@i-regional-ms-vm:~$ ftp 10.13.132.6
- get  contrail-cloud-docker_4.0.1.0-32-newton_xenial.tgz
- get  contrail-server-manager-installer_4.0.1.0-32~xenial.deb


ubuntu@i-regional-ms-vm:~$ sudo dpkg -i contrail-server-manager-installer_4.0.1.0-32~xenial.deb

```
ubuntu@i-regional-ms-vm:~$ sudo /opt/contrail/contrail_server_manager/provision_containers.sh -h
Usage

/opt/contrail/contrail_server_manager/provision_containers.sh
        -h --help
        -c|--contrail-package <pkg>
        -d|--default-domain <domain name>
        -ni|--no-install-sm-lite
        -cp|--cleanup-puppet-agent
        -j|--json
        -t|--testbed <testbed.py>
        -swp|--sm-webui-port
        -ip|--hostip
        -cid|--cluster-id <cluster-id>
        -sku|--sku <openstack-sku>

ubuntu@i-regional-ms-vm:~$
```



working scenario

sudo /opt/contrail/contrail_server_manager/provision_containers.sh -j all-in-one-newton.json -ip 10.13.132.196 -sku newton

- after reboot, add rabittmq ctrl address
- fix failed processes by docker exec



```
ubuntu@i-regional-ms-vm:~$ sudo /opt/contrail/contrail_server_manager/provision_containers.sh -j all-in-one.json -ip 10.13.132.196 -sku newton
----> Install server manager without cobbler option
----> This install is being logged at: /var/log/contrail/install_logs/install_2017_10_03__03_35_24.log
    ----> Cleaning up existing sources.list and Server Manager sources file
    ----> Allow Install of Unauthenticated APT packages
grep: /etc/apt/apt.conf: No such file or directory

```

```
ubuntu@i-regional-ms-vm:~$ sudo /opt/contrail/contrail_server_manager/provision_containers.sh -j all-in-one.json -ip 10.13.132.196 -sku newton
----> Install server manager without cobbler option
----> This install is being logged at: /var/log/contrail/install_logs/install_2017_10_03__03_54_40.log
    ----> Cleaning up existing sources.list and Server Manager sources file
    ----> Allow Install of Unauthenticated APT packages
    ----> Installing dependent packages for Setting up Smgr repos
dpkg-scanpackages: warning: package python-pyvmomi (filename ./python-pyvmomi_6.5.0-yakkety1_all.deb) is repeat but newer version; used that one and ignored data from ./python-pyvmomi_6.5-1_all.deb!
dpkg-scanpackages: warning: package python-urllib3 (filename ./python-urllib3_1.19.1-1~cloud0_all.deb) is repeat but newer version; used that one and ignored data from ./python-urllib3_1.15.1-2~cloud0_all.deb!
dpkg-scanpackages: info: Wrote 435 entries to output Packages file.
----> Server Manager
    ----> Upgrading Server Manager to version 4.0.1.0-32
    ----> Using default puppet certificate name i-regional-ms-vm.vcpe.pslab.juniper.net
    ----> Installing package  Puppetmaster Passenger
    ----> Installing package  Server Manager Lite
Configuring Ansible
Starting docker if required
   Active: active (running) since Tue 2017-10-03 03:50:02 UTC; 5min ago
Docker insecure-registry option already set
DOCKER_OPTS alredy set in systemd option
Docker registry already running
----> Completed Installing Server Manager
----> Server Manager Cliff Client
    ----> Installing package  Server Manager Cliff Client
----> Completed Installing Server Manager Cliff Client
----> Web Server Manager
    ----> Installing package  Contrail Web Core
    ----> Installing package  Contrail Web Server Manager
----> Completed Installing Web Server Manager
        ----> Starting Server Manager Lite Service
----> Reverting Repos to old state
SM installation took 0 minutes and 52 seconds.
----> Pre provision checks to make sure setup is ready for contrail provisioning

```




sudo puppet cert clean i-contrail-analytics-vm.vcpe.pslab.juniper.net

sudo find /var/lib/puppet/ssl -name i-contrail-analytics-vm.vcpe.pslab.juniper.net.pem -delete

server-manager delete image --image_id contrail_4_0_1_32

/opt/contrail/contrail_server_manager/provision_status.sh


apt install vlan
apt install docker.io

```
ubuntu@i-contrail-analytics-vm:~$ diff rabbitmq.config /etc/rabbitmq/
3c3
<        {tcp_listeners, [{"192.168.10.21", 5672}]},
---
>        {tcp_listeners, [{"0.0.0.0", 5672}]},
ubuntu@i-contrail-analytics-vm:~$
```

needed to add below in /etc/hosts (ip and name may be different)
this was added during provisioing, but lost after reloading
192.168.10.21 i-contrail-analytics-vmctrl


```
ubuntu@i-contrail-analytics-vm:~$ sudo docker exec -it analytics contrail-status
== Contrail Analytics ==
contrail-collector:           initializing (Database:i-contrail-analytics-vm:Global connection down)
contrail-analytics-api:       active
contrail-query-engine:        timeout
contrail-alarm-gen:           active
contrail-snmp-collector:      active
contrail-topology:            active
contrail-analytics-nodemgr:   active
ubuntu@i-contrail-analytics-vm:~$ sudo docker exec -it controller contrail-status
== Contrail Control ==
contrail-control:             active
contrail-named:               active
contrail-dns:                 active
contrail-control-nodemgr:     active
== Contrail Config ==
contrail-api:                 active
contrail-schema:              active
contrail-svc-monitor:         active
contrail-device-manager:      active
contrail-config-nodemgr:      active
== Contrail Config Database==
contrail-database:            active

== Contrail Web UI ==
contrail-webui:               active
contrail-webui-middleware:    active
== Contrail Support Services ==
zookeeper:                    active
rabbitmq-server:              inactive             (disabled on boot)
ubuntu@i-contrail-analytics-vm:~$
```


```
ubuntu@i-contrail-analytics-vm:~$ sudo docker exec -it analyticsdb contrail-status
== Contrail Database ==
contrail-database:            inactive

kafka:                        active
contrail-database-nodemgr:    active
ubuntu@i-contrail-analytics-vm:~$ sudo docker exec -it analyticsdb systemctl restart contrail-database
ubuntu@i-contrail-analytics-vm:~$ sudo docker exec -it analyticsdb contrail-status
== Contrail Database ==
contrail-database:            active

kafka:                        active
contrail-database-nodemgr:    active
ubuntu@i-contrail-analytics-vm:~$
```

