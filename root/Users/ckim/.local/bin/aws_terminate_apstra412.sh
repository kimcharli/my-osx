#!/bin/bash

EC2NAME=apstra-412

NOVERIFYSSL=--no-verify-ssl 

EC2STATUS=$(aws $NOVERIFYSSL ec2 describe-instances \
    --filters "Name=tag:Name,Values=$EC2NAME" \
    --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value|[0], PublicIpAddress, State.Name ]" \
    --output text
)

echo $EC2STATUS

EC2ID=$(echo $EC2STATUS | cut -d' ' -f1)
EC2RUNNING=$(echo $EC2STATUS | cut -d' ' -f4)
if [[ $EC2RUNNING == 'running' ]]; then
  aws $NOVERIFYSSL ec2 terminate-instances --instance-ids $EC2ID
fi

