#!/bin/sh
if [[ -z $(aws s3api head-bucket --bucket $STATE_BUCKET_NAME) ]]; then
    aws s3api create-bucket --bucket $STATE_BUCKET_NAME --region ap-southeast-1
fi