#!/bin/bash

case $ENVIRONMENT in 
    dev)
        echo setting environment to dev
        ;;
    production)
        echo Setting environment to production
        ;;
    staging)
        echo Setting environment to staging
        ;;
    *)
    echo Please enter  a valid environment: dev, staging, or production
    exit 1
    ;;
esac

if [ $SERVICE != 'postgres' ]
then 
    echo postgres is the only service available
    exit 1
fi 

echo Please Enter AWS Credentials

read -p 'Access_Key: ' accessKey
echo
read -sp 'Secret_Key: ' secretKey
echo
read -p 'Session Token: ' sessionToken
echo
read -p 'Region: ' region

export AWS_ACCESS_KEY_ID=$accessKey
export AWS_SECRET_ACCESS_KEY=$secretKey
export AWS_SESSION_TOKEN=$sessionToken
 
export POSTGRES_PASSWORD=`aws ssm get-parameter --name "/${ENVIRONMENT}/${SERVICE}/POSTGRES_PASSWORD" --region $region --query "Parameter.Value" --output text`
export POSTGRES_USER=`aws ssm get-parameter --name "/${ENVIRONMENT}/${SERVICE}/POSTGRES_USER" --region $region --query "Parameter.Value" --output text`

