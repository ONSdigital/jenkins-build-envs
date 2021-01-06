#!/bin/bash

tags=$1
imageid=$2
reponame=$3

for aTag in $(echo $tags | sed "s/,/ /g")
do
    # call your procedure/other scripts here below
    printf "\n\nTagging $imageid with $aTag\n"
    docker tag "$imageid" "onsdigital/$reponame:$aTag"
    docker tag "$imageid" "ashjindal/$reponame:$aTag"
    # docker tag "$imageid" "arti:8081/onsdigital/$reponame:$aTag"
done

# docker tag ac508c28f0f6 onsdigital/jenkins-slave-cm 
 # docker tag ac508c28f0f6 ashjindal/jenkins-slave-cm 
 # docker tag ac508c28f0f6 arti:8081/onsdigital/jenkins-slave-cm

printf "\n\nPushing $imageid to $reponame\n"
docker push -a "onsdigital/$reponame"
docker push -a "ashjindal/$reponame"
# docker push -a "arti:8081/onsdigital/$reponame"
