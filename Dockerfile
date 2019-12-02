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

WORKDIR work_dir
RUN chmod 777 /work_dir
RUN mkdir -p /work_dir/.local && chmod 777 /work_dir/.local && \
    mkdir -p /work_dir/.keras && chmod 777 /work_dir/.keras && \
    mkdir -p /work_dir/.jupyter && chmod 777 /work_dir/.jupyter



RUN mkdir /app
COPY startup.sh /app/startup.sh

EXPOSE 8888
ENTRYPOINT /app/startup.sh
