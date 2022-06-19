#!/bin/bash
# build script of docker container

VERSION=2.0.1

if [ -z "$ACCOUNT_NAME" ]
then
      echo "\$ ACCOUNT_NAME set to empty string, export one value"
      exit 1
fi
if [ -z "$ACCOUNT_KEY" ]
then
      echo "\$ ACCOUNT_KEY set to empty string, export one value"
      exit 1
fi



docker build --build-arg ACCOUNT_NAME=$ACCOUNT_NAME --build-arg ACCOUNT_KEY=$ACCOUNT_KEY -t opensearch .
az acr login --name guided
#docker tag opendistro-elasticsearch guided.azurecr.io/opendistro-for-elasticsearch
#docker push guided.azurecr.io/opendistro-for-elasticsearch

docker login opensearch.azurecr.io -u opensearch -p 'password'
docker tag opensearch opensearch.azurecr.io/opensearch:$VERSION
docker push opensearch.azurecr.io/opensearch:$VERSION

