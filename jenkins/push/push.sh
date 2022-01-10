#!/bin/bash

echo "***************************"
echo "** Pushing  Image **"
echo "***************************"

BUILD_TAG=$TAG

echo "*** Loged out ***"
docker logout
echo "*** Tagging Image ***"
#docker tag $IMAGE:$BUILD_TAG tosaporn/$IMAGE:$BUILD_TAG
echo "*** Loged in ***"
docker login docker.io -u tosaporn -p $PASSWORD_DOCKER
echo "*** PUSHING ****"
docker push tosaporn/$IMAGE:$BUILD_TAG