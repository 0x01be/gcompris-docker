FROM 0x01be/gcompris:build as build

FROM 0x01be/xpra

COPY --from=build /opt/gcompris/ /opt/gcompris/

RUN apk add --no-cache --virtual gcompris-runtime-depepndencies \
    qt5-qtbase \
    qt5-qtdeclarative \
    qt5-qtmultimedia \
    qt5-qtsvg \
    qt5-qtxmlpatterns \
    qt5-qttools \
    qt5-qtsensors

USER ${USER}
ENV PATH=${PATH}:/opt/gcompris/bin \
    COMMAND=gcompris

