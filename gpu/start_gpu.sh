#!/bin/sh
set -x

#llamafile=./bin/llamafile-0.8.13
#model=./bin/llava-v1.5-7b-mmproj-Q4_0.gguf

# Set up CDI on host (outside container):
# 1. install nvidia-container-toolkit-base if available (smaller) or nvidia-container-toolkit
# 2. sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml
# 3. nvidia-ctk cdi list  --> should output nvidia.com/gpu=xyz

llamafile=./../models/llava-v1.5-7b-q4.llamafile

podman build -t localhost/llamafilegpu .
podman volume create llamafile_home || true

# On first start, it compiles the cuda crap to /root/.llamafile 
# Subsequent startups are faster

podman run --rm -it \
-p 127.0.0.1:8080:8080/tcp \
-v "$llamafile":/llamafile:ro \
-v ./../models:/models:ro \
-v llamafile_home:/root/.llamafile \
--device nvidia.com/gpu=all \
localhost/llamafilegpu \
/bin/sh /llamafile --nobrowser --host 0.0.0.0 --port 8080 --gpu nvidia

