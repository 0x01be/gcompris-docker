FROM 0x01be/base

ENV REVISION=master
RUN apk add --no-cache --virtual gcompris-build-depepndencies \
    git \
    build-base \
    cmake \
    qt5-qtbase-dev

RUN git clone --recursive --branch ${REVISION} https://github.com/gcompris/GCompris-qt.git /gcompris

WORKDIR /gcompris/build

RUN apk add qt5-qtdeclarative-dev
RUN apk add qt5-qtmultimedia-dev
RUN apk add qt5-qtsvg-dev
RUN apk add qt5-qtxmlpatterns-dev
RUN apk add qt5-qttools-dev
RUN apk add qt5-qtsensors-dev

RUN cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/gcompris \
    ..
RUN make
RUN make install

