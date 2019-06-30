ARG tf_docker_tag="latest-gpu-py3"
FROM tensorflow/tensorflow:${tf_docker_tag}

RUN pip install jupyterlab \
                scikit-learn \
                scikit-image \
                pandas \
                keras

RUN apt-get update && \
    apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

RUN jupyter labextension install @jupyterlab/toc

RUN mkdir -p /.local && chmod 777 /.local && \
    mkdir -p /.jupyter && chmod 777 /.jupyter

WORKDIR work_dir

RUN mkdir /app
COPY startup.sh /app/startup.sh

EXPOSE 8888
ENTRYPOINT /app/startup.sh
