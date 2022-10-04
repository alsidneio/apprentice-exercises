#!/bin/bash
set -e 

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
    ;;
esac

if [ $SERVICE != 'postgres' ]
then 
    echo postgres is the only service available
fi 

export POSTGRES_PASSWORD=`aws ssm get-parameter --name "/${ENVIRONMENT}/${SERVICE}/POSTGRES_PASSWORD" --region ${REGION} --query "Parameter.Value" --output text`
export POSTGRES_USER=`aws ssm get-parameter --name "/${ENVIRONMENT}/${SERVICE}/POSTGRES_USER" --region ${REGION} --query "Parameter.Value" --output text`

exec docker-entrypoint.sh "$@"
