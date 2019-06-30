#!/usr/bin/env bash

TF_DOCKER_TAG="latest-py3 latest-gpu-py3 nightly-py3 nightly-gpu-py3"

function build () {
  tag=$1
  echo $tag
  docker build --build-arg tf_docker_tag=$tag \
               --tag jupyterlab-tf: \
               .
}


git fetch --all --tags --prune

for tag in $TF_DOCKER_TAG;
do
  echo "building tag: $tag"
  build $tag
done
