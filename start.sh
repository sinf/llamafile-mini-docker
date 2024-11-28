#!/bin/sh
set -x

#llamafile=./bin/llamafile-0.8.13
#model=./bin/llava-v1.5-7b-mmproj-Q4_0.gguf

llamafile=./models/llava-v1.5-7b-q4.llamafile

podman build -t localhost/nothing .

podman run --rm -it \
-p 127.0.0.1:8080:8080/tcp \
-v "$llamafile":/llamafile:ro \
-v ./models:/models:ro \
localhost/nothing \
/bin/sh -c '/busybox --install /bin && /bin/sh /llamafile --nobrowser --host 0.0.0.0 --port 8080'

#-v "$model":/model.gguf:ro \

# test if you can query inside the container
#podman exec -t containername /bin/wget --post-data '{"prompt":"hi"}' http://127.0.0.1:8080/completion -q -O -

# test if you can query outside the container
# curl --data-raw '{"prompt":"hi"}' http://127.0.0.1:8080/completion -v

