#!/bin/bash

echo springboot-helloworld > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /var/jenkins_home/key-pairs/remote-key /tmp/.auth remote_user@remote_host_prod:/tmp/.auth && \
scp -i /var/jenkins_home/key-pairs/remote-key /tmp/deploy/publish.sh remote_user@remote_host_prod:/tmp/publish.sh && \
scp -i /var/jenkins_home/key-pairs/remote-key /tmp/deploy/docker-compose.yaml remote_user@remote_host_prod:/tmp/docker-compose.yaml
#ssh -i /var/jenkins_home/key-pairs/remote-key remote_user@remote_host_prod '/tmp/publish.sh'
