#!/bin/bash

echo "*****************"
echo "*** Building jar *******"
echo "*****************"
WORKSPACE=/var/jenkins_home/workspace/pipeline-docker-maven
docker run --rm -v /var/jenkins_home/:/tmp/jenkins_home -v /root/.m2/:/root/.m2/ maven:3.8.4-openjdk-8 "$@"