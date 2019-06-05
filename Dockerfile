FROM tensorflow/tensorflow:latest-gpu-py3
RUN pip install jupyterlab
RUN jupyter lab --ip="0.0.0.0"
