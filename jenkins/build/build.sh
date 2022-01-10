#!/bin/bash

#copy new jar to build location
WORKSPACE=$PWD

cp -f $WORKSPACE/java-app/target/*.jar $WORKSPACE/jenkins/build/

echo "***************************"
echo "** Building Docker Image **"
echo "***************************"

cd jenkins/build/ && docker-compose build --no-cache