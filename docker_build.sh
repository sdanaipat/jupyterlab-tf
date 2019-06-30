#!/usr/bin/env bash

TF_DOCKER_TAGS="latest-py3 latest-gpu-py3 nightly-py3 nightly-gpu-py3"

function build () {
  tf_tag=$1
  docker build --build-arg tf_docker_tag=$tf_tag \
               --tag sdanaipat/jupyterlab-tf:latest-$tf_tag \
               . && \
  docker push sdanaipat/jupyterlab-tf:latest-$tf_tag
}

git fetch --all --tags --prune
current_branch=$(git branch | grep \* | cut -d ' ' -f2)
git stash

git checkout master
  for tf_tag in $TF_DOCKER_TAGS;
  do
    echo "building tf-tag: $tf_tag"
    build $tf_tag
  done

git checkout $current_branch
git stash pop
