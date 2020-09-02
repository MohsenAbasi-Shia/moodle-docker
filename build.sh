#!/bin/bash

set -x
. build.properties
. build.properties.env

docker build --force-rm  \
    -t $REPO_NAME:$VERSION \
    --build-arg PERSONALACCESSTOKEN=$TOKEN \
    --build-arg USERNAME=$USER \
    --build-arg BRANCH=$VERSION \
    --build-arg PROXY=$PROXY .
