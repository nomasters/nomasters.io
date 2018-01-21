#!/usr/bin/env bash

# exit on error
set -e

export AWS_ACCESS_KEY_ID=$TF_VAR_nomasters_site_aws_access_key
export AWS_SECRET_ACCESS_KEY=$TF_VAR_nomasters_site_aws_secret_key
export AWS_REGION=us-east-1

DIR=site
BUCKET=s3://nomasters.io

cd $DIR
hugo
aws s3 sync public/ $BUCKET --acl public-read
