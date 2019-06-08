nvidia-docker run -it \
                  --rm \
                  --name tensorflow-container
                  -u $(id -u):$(id -g) \
                  -v ${HOME}/notebooks:/tf/notebooks \
                  -v /mnt/data:/tf/data \
                  -v /mnt/work_ssd:/tf/ssd \
                  -p 8888:8888 \
                  tensorflow
