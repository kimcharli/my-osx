#!/bin/bash -e

SSMPATH="$1"
if [ -z "$SSMPATH" ]; then
  echo "Provide a value for SSMPATH, like /ck-apstra-api/aws/dev/."
  exit 1
fi

ENVFILE=env

rm -f $ENVFILE

aws ssm get-parameters-by-path \
  --path "$SSMPATH" \
  --with-decryption \
  --query "Parameters[*].[Name,Value]" \
  --output text |
  while read line
  do
    name=$(echo ${line} | cut -f 1 -d ' ' | sed "s|$SSMPATH||")
    value=$(echo ${line} | cut -f 2 -d ' ')
    echo "${name}=${value}" >> $ENVFILE
  done


