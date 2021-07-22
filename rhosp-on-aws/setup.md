
http://superuser.openstack.org/articles/deploying-openstack-aws-tutorial/
https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/10/html/director_installation_and_usage/chap-requirements


## RHEL on AWS needs other license from thirdparty

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





