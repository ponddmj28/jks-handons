#!/bin/bash

PATH=$PATH

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

docker login -u tosaporn -p $PASS
cd /tmp && docker-compose up -d
