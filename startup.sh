#!/usr/bin/env bash
export HOME=/work_dir

tensorboard --logdir /work_dir/tensorboard \
            --port 6006 &

jupyter lab --ip="0.0.0.0" \
            --no-browser .
