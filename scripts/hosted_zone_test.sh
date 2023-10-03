#!/usr/bin/env bash

export ENVIRONMENT=$1
export ACCOUNT=$2
export ACCOUNT_VAR=".${ACCOUNT}_account_id"
export ASSUME_ROLE=$(cat ${ENVIRONMENT}.auto.tfvars.json | jq -r .assume_role)
export AWS_ACCOUNT_ID=$(cat ${ENVIRONMENT}.auto.tfvars.json | jq -r .${ACCOUNT}_account_id)

echo "debug:"
echo "ENVIRONMENT ${ENVIRONMENT}"
echo "ACCOUNT ${ACCOUNT}"
echo "ACCOUNT_VAR ${ACCOUNT_VAR}"
echo "ASSUME_ROLE ${ASSUME_ROLE}"

aws sts assume-role --output json --role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/${ASSUME_ROLE} --role-session-name lab-platform-hosted-zones-test > credentials

export AWS_ACCESS_KEY_ID=$(cat credentials | jq -r ".Credentials.AccessKeyId")
export AWS_SECRET_ACCESS_KEY=$(cat credentials | jq -r ".Credentials.SecretAccessKey")
export AWS_SESSION_TOKEN=$(cat credentials | jq -r ".Credentials.SessionToken")
export AWS_DEFAULT_REGION=$(cat ${ENVIRONMENT}.auto.tfvars.json | jq -r .aws_region)

rspec test/${ACCOUNT}_account.rb
