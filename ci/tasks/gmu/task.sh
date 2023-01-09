#! /bin/bash

aws s3 cp $S3_BUCKET/$CERT_FOLDER ./certs --recursive

aws s3 cp $S3_BUCKET/$GMU_FOLDER ./gmudownload

cp -R gmudownload certs gmu

ls gmu
