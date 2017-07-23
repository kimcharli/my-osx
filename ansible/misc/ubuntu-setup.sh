
if ["$1" == ""]
then
  SSHHOST=10.85.86.73
else
  SSHHOST=$1
fi

set -x

SSHUSER=contrail
ROOTPASSWORD=contrail123

ssh-copy-id -o StrictHostKeyChecking=no contrail@$SSHHOST
ssh -t $SSHUSER@$SSHHOST "echo '$SSHUSER ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/$SSHUSER"
ssh $SSHUSER@$SSHHOST "echo \"root:$ROOTPASSWORD\" | sudo chpasswd"
ssh $SSHUSER@$SSHHOST "sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/'  /etc/ssh/sshd_config"
ssh $SSHUSER@$SSHHOST "sudo service ssh restart"
ssh-copy-id root@$SSHHOST

