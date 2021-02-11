#!/bin/bash

tags=$1
imageid=$2
reponame=$3

for aTag in $(echo "$tags" | sed "s/,/ /g")
do
    printf "%b" "\n\nTagging $imageid with $aTag\n"
    docker tag "$imageid" "onsdigital/$reponame:$aTag"
    docker tag "$imageid" "ashjindal/$reponame:$aTag"
done

for aTag in $(echo "$tags" | sed "s/,/ /g")
do
    printf "%b" "\n\nPushing $imageid to onsdigital/$reponame:$aTag \n"
    docker push  "onsdigital/$reponame:$aTag"

    printf "%b" "\n\nPushing $imageid to ashjindal/$reponame:$aTag\n"
    docker push  "ashjindal/$reponame:$aTag"
done


