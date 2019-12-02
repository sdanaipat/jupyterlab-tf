#!/usr/bin/env bash
runtime=${1:-nvidia}
tag=${2:-latest}

mkdir -p ${HOME}/.keras
mkdir -p ${HOME}/.jupyter
mkdir -p ${HOME}/.local

docker run --runtime $runtime \
           -it \
           --rm \
           --name jupyterlab-tf \
           -u $(id -u):$(id -g) \
           -v ${HOME}/.local:/work_dir/.local \
           -v ${HOME}/.keras:/work_dir/.keras \
           -v ${HOME}/.jupyter:/work_dir/.jupyter \
           -v ${HOME}/notebooks:/work_dir/notebooks \
           -v /mnt/data:/work_dir/data \
           -v /mnt/work_ssd:/work_dir/ssd \
           -p 8888:8888 \
           -p 6006:6006 \
           sdanaipat/jupyterlab-tf:$tag
