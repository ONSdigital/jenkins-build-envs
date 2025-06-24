#!/bin/sh
set -e

apk add --no-cache aws-cli
dockerd &
sleep 5

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
LOADED_IMAGE=$(docker load -i image/image.tar | grep "Loaded image ID:" | cut -d: -f3)
docker tag $LOADED_IMAGE public.ecr.aws/$ECR_REGISTRY_ALIAS/$ECR_REPOSITORY:$IMAGE_VERSION
docker push public.ecr.aws/$ECR_REGISTRY_ALIAS/$ECR_REPOSITORY:$IMAGE_VERSION