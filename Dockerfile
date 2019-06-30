ARG tf_docker_tag
FROM tensorflow/tensorflow:${tf_docker_tag}

RUN pip install jupyterlab

WORKDIR work_dir
RUN chmod 777 /work_dir

RUN mkdir /.local && \
    chmod 777 /.local

COPY startup.sh work_dir/startup.sh

EXPOSE 8888
ENTRYPOINT work_dir/startup.sh
