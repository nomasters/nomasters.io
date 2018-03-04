#!/usr/bin/env bash

# exit on error
set -e

DIR=site
BUCKET=s3://nomasters.io
DIST_ID=$NOMASTERS_CDN_DIST_ID
CACHE_ID=`date +%s`
FORMATTED_JSON='{"Paths": {"Quantity": 1,"Items": ["/*"]},"CallerReference":"'${CACHE_ID}'"}'

cd $DIR
hugo
aws s3 sync public/ $BUCKET --acl public-read
aws cloudfront create-invalidation --distribution-id $DIST_ID --invalidation-batch "$FORMATTED_JSON"