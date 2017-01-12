#!/bin/sh

if [ "${CXX}" = clang++ ]; then
    UNUSEDARGS="-Qunused-arguments"
fi

COMPILER="ccache ${CXX} ${UNUSEDARGS}"

if [ "${DOCKERSYS}" = debian ]; then
    docker exec ${DOCKERSYS} qmake -qt=5 Webcamoid.pro \
        QMAKE_CXX="${COMPILER}"

    docker exec ${DOCKERSYS} make
elif [ "${TRAVIS_OS_NAME}" = linux ]; then
    qmake Webcamoid.pro \
        QMAKE_CXX="${COMPILER}"

    make
elif [ "${TRAVIS_OS_NAME}" = osx ]; then
    LIBUSBVER=$(ls /usr/local/Cellar/libusb | tail -n 1)
    LIBUVCVER=$(ls /usr/local/Cellar/libuvc | tail -n 1)

    qmake Webcamoid.pro \
        QMAKE_CXX="${COMPILER}" \
        LIBUSBINCLUDES=/usr/local/Cellar/libusb/${LIBUSBVER}/include \
        LIBUVCINCLUDES=/usr/local/Cellar/libuvc/${LIBUVCVER}/include \
        LIBUVCLIBS=-L/usr/local/Cellar/libuvc/${LIBUVCVER}/lib \
        LIBUVCLIBS+=-luvc

    make
fi
