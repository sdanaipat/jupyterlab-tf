#!/usr/bin/env bash

TF_DOCKER_TAGS="latest-py3 latest-gpu-py3 nightly-py3 nightly-gpu-py3"

function build () {
  git_tag=$1
  tf_tag=$2
  docker build --build-arg tf_docker_tag=$tf_tag \
               --tag sdanaipat/jupyterlab-tf:$git_tag-$tf_tag \
               . && \
  docker push sdanaipat/jupyterlab-tf:$git_tag-$tf_tag
}

git fetch --all --tags --prune
current_branch=$(git branch | grep \* | cut -d ' ' -f2)

git stash
GIT_TAGS="master $(git tag)"
for git_tag in $GIT_TAGS;
do
  git checkout git_tag
  for tf_tag in $TF_DOCKER_TAGS;
  do
    echo "building git-tag: $git_tag, tf-tag: $tf_tag"
    build $git_tag $tf_tag
  done
done

git checkout $current_branch
git stash pop
