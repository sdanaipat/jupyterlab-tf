ARG tf_docker_tag
FROM tensorflow/tensorflow:${tf_docker_tag}

RUN pip install jupyterlab \
                scikit-learn \
                scikit-image \
                pandas \
                keras

WORKDIR work_dir
RUN chmod 777 /work_dir

RUN mkdir -p /.local && chmod 777 /.local && \
    mkdir -p /.jupyter && chmod 777 /.jupyter

COPY startup.sh work_dir/startup.sh

EXPOSE 8888
ENTRYPOINT work_dir/startup.sh
