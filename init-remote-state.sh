#!/bin/sh
if [[ -n $(aws s3api head-bucket --bucket $STATE_BUCKET_NAME 2>&1 || true) ]]; then
    aws s3api create-bucket --bucket $STATE_BUCKET_NAME --region ap-southeast-1
fi
