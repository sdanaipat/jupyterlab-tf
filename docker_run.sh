docker run -it \
           --rm \
           --name jupyterlab-tf
           -u $(id -u):$(id -g) \
           -v ${HOME}/notebooks:/work_dir/notebooks \
           -v /mnt/data:/work_dir/data \
           -v /mnt/work_ssd:/work_dir/ssd \
           -p 8888:8888 \
           sdanaipat/jupyter-tf
