FROM scratch
WORKDIR /
COPY --chown=0:0 --chmod=555 ./bin/busybox /busybox
COPY --chown=0:0 --chmod=555 ./bin/busybox /bin/sh
#RUN /busybox --install /bin
#COPY --chown=0:0 --chmod=500 llava-v1.5-7b-q4.llamafile .
#EXPOSE 8080
#ENTRYPOINT "/entrypoint"

