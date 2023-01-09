#! /bin/bash

aws s3 cp $S3_BUCKET/$CERT_FOLDER ./certs --recursive

aws s3 cp $S3_BUCKET/$GMU_FOLDER ./gmu 

ls

ls certs

ls gmu
