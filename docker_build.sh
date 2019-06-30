#!/usr/bin/env bash

VERSION=1.0

TF_DOCKER_TAG="latest-py3 latest-gpu-py3 nightly-py3 nightly-gpu-py3"

function build () {
  tag=$1
  echo $tag
  docker build --build-arg tf_docker_tag=$tag \
               --tag jupyterlab-tf: \
               .
}

for tag in $TF_DOCKER_TAG;
do
  echo "building tag: $tag"
  build $tag
done
