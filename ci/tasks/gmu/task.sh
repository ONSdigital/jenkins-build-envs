#! /bin/bash

aws s3 cp $S3_BUCKET/$CERT_FOLDER ./certs --recursive

aws s3 cp $S3_BUCKET/$GMU_FOLDER ./gmudownload

ls

ls certs

ls gmu

cp -R gmudownload gmu
cp -R certs gmu
