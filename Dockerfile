ARG tf_docker_tag="latest-gpu-py3"
FROM tensorflow/tensorflow:${tf_docker_tag}


RUN mkdir /app
COPY startup.sh /app/startup.sh
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

RUN apt-get update && \
    apt-get install -y curl git

RUN git clone https://github.com/NVIDIA/apex && \
    cd apex && \
    pip install -v --no-cache-dir ./ && \
    rm -rf /apex

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

RUN jupyter labextension install @jupyterlab/toc

WORKDIR work_dir
RUN chmod 777 work_dir

EXPOSE 8888
ENTRYPOINT /app/startup.sh
