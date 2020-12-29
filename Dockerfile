FROM 0x01be/base

ENV REVISION=master
RUN apk add --no-cache --virtual gcompris-build-depepndencies \
    git \
    build-base \
    cmake \
    qt5-qtbase-dev \
    qt5-qtdeclarative-dev \
    qt5-qtmultimedia-dev \
    qt5-qtsvg-dev \
    qt5-qtxmlpatterns-dev \
    qt5-qttools-dev \
    qt5-qtsensors-dev &&\
    git clone --recursive --branch ${REVISION} https://github.com/gcompris/GCompris-qt.git /gcompris

WORKDIR /gcompris/build

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/gcompris \
    .. &&\
    make
RUN make install

