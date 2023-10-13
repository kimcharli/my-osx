#!/bin/bash

EC2NAME=apstra-412
TAGSPEC=ResourceType=instance,Tags=[{Key=Name,Value=$EC2NAME}]
echo $TAGSPEC
AMIID=ami-073dd34df745de6c0
#AMIID=ami-04c13c46b19466971

# aws --no-verify-ssl ec2 run-instances --image-id ami-04c13c46b19466971 --count 1 --instance-type t2.2xlarge --key-name ckim-mbp --security-group-ids sg-0932fbed3049c69df --subnet-id subnet-0f5354e4a2f0d241d --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$EC2NAME}]'
aws --no-verify-ssl ec2 run-instances --image-id $AMIID --count 1 --instance-type t2.2xlarge --key-name ckim-mbp --security-group-ids sg-0932fbed3049c69df --subnet-id subnet-0f5354e4a2f0d241d --associate-public-ip-address --tag-specifications $TAGSPEC --block-device-mappings "[{ \"DeviceName\": \"/dev/sda1\", \"Ebs\": { \"DeleteOnTermination\": true } },{ \"DeviceName\": \"/dev/sdf\", \"Ebs\": { \"DeleteOnTermination\": true } }]"


