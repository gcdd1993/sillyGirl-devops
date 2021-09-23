#! /bin/bash
version=v$(date "+%Y%m%d")

set -ex
#echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -f Dockerfile -t gcdd1993/silly-girl:latest -t gcdd1993/silly-girl:"$version" .
docker push gcdd1993/silly-girl:latest
docker push gcdd1993/silly-girl:"$version"
