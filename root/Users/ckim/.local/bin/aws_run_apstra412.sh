#!/bin/bash

EC2NAME=apstra-412
NOVERIFYSSL=--no-verify-ssl 

# EC2STATUS=$(aws $NOVERIFYSSL ec2 describe-instances \
#     --filters "Name=tag:Name,Values=$EC2NAME" \
#     --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value|[0], PublicIpAddress, State.Name ]" \
#     --output text
# )

# echo $EC2STATUS

# EC2ID=$(echo $EC2STATUS | cut -d' ' -f1)
# EC2RUNNING=$(echo $EC2STATUS | cut -d' ' -f4)


aws $NOVERIFYSSL ec2 run-instances --image-id ami-04c13c46b19466971 --count 1 --instance-type t2.2xlarge --key-name ckim-mbp --security-group-ids sg-0932fbed3049c69df --subnet-id subnet-0f5354e4a2f0d241d --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=$EC2NAME}]'


