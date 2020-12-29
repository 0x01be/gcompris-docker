FROM 0x01be/xpra

RUN apk add --no-cache --virtual gcompris-runtime-depepndencies \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    gcompris-qt \
    mesa-dri-swrast

USER ${USER}
ENV PATH=${PATH}:/opt/gcompris/bin \
    COMMAND=gcompris-qt

