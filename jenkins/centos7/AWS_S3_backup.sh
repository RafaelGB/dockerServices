#! /bin/bash

DATE=$(date +%Y-%m-%d--%H:%M:%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
export AWS_ACCESS_KEY_ID=$4
export AWS_SECRET_ACCESS_KEY=$5
BUCKET_NAME=$6


mysqldump --column-statistics=0 -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME> /tmp/db-$DATE.sql && \
	aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME
