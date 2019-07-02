#!/usr/bin/env bash
runtime=$1
tag=$2

mkdir -p ${HOME}/.keras
mkdir -p ${HOME}/.jupyter

docker run $runtime -it \
           --rm \
           --name jupyterlab-tf \
           -u $(id -u):$(id -g) \
           -v ${HOME}/.keras:/work_dir/.keras \
           -v ${HOME}/.jupyter:/work_dir/.jupyter \
           -v ${HOME}/notebooks:/work_dir/notebooks \
           -v /mnt/data:/work_dir/data \
           -v /mnt/work_ssd:/work_dir/ssd \
           -p 8888:8888 \
           sdanaipat/jupyterlab-tf:$tag
