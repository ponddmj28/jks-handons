#!/bin/bash

#copy new jar to build location

cp -f java-app/target/.*jar jenkins/build/

echo "***************************"
echo "** Building Docker Image **"
echo "***************************"

cd jenkins/build/ && docker-compose build --no-cache