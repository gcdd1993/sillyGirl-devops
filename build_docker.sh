#! /bin/bash
version=v$(date "+%Y%m%d")

set -ex
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -f Dockerfile -t gcdd1993/sillyGirl:latest -t gcdd1993/sillyGirl:"$version" .
docker push gcdd1993/sillyGirl:latest
docker push gcdd1993/sillyGirl:"$version"
