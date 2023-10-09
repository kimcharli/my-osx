#!/bin/bash

 aws --no-verify-ssl ec2 describe-instances \
    --filters Name=tag-key,Values=Name \
    --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value|[0], PublicIpAddress, State.Name ]" \
    --output text


