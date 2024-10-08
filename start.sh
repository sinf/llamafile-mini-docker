#!/bin/sh
set -x

#llamafile=./bin/llamafile-0.8.13
#model=./bin/llava-v1.5-7b-mmproj-Q4_0.gguf

llamafile=./models/llava-v1.5-7b-q4.llamafile

podman build -t localhost/nothing .

podman run --rm -it \
-p 8080:8080 \
-v "$llamafile":/llamafile:ro \
-v ./models:/models:ro \
localhost/nothing \
/bin/sh -c '/busybox --install /bin && /bin/sh /llamafile'

#-v "$model":/model.gguf:ro \

