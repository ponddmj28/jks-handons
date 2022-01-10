#!/bin/bash

echo "*****************"
echo "*** Test jar *******"
echo "*****************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ maven:3.8.4-openjdk-8 "$@"