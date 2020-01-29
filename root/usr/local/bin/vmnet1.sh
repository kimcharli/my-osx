sudo ifconfig vmnet1 192.168.137.2 netmask 255.255.255.0
sudo route -n delete 10.4.2.0/24 192.168.137.1
sudo route -n add 10.4.2.0/24 192.168.137.1
sshuttle -r server1 10.4.2.64/26

