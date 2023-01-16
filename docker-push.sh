#!/bin/bash

tags=`grep image: docker-compose.yml | awk -F":" '{  print $2 ":" $3}'`




#tags=$1
#imageid=$2
#reponame=$3

#for aTag in $(echo "$tags" | sed "s/,/ /g")
#do
#    printf "%b" "\n\nTagging $imageid with $aTag\n"
#    docker tag "$imageid" "onsdigital/$reponame:$aTag"
#done
#
for aTag in $(echo "$tags" | sed "s/,/ /g")
do
    printf "%b" "\n\nPushing  $aTag \n"
#    docker push  "$aTag"
done


