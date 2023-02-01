#! /bin/bash

aws s3 cp $S3_BUCKET/$CERT_FOLDER ./certs --recursive

aws s3 cp $S3_BUCKET/$GMU_FOLDER ./gmudownload/gmu.zip

yum -y install unzip

unzip -d ./gmudownload -u ./gmudownload/gmu.zip

rm ./gmudownload/gmu.zip

cp -R gmudownload certs gmu-output

ls gmudownload
