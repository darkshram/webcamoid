# Webcamoid, webcam capture application.
# Copyright (C) 2011-2015  Gonzalo Exequiel Pedone
#
# Webcamoid is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Webcamoid is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Webcamoid. If not, see <http://www.gnu.org/licenses/>.
#
# Email   : hipersayan DOT x AT gmail DOT com
# Web-Site: http://github.com/hipersayanX/webcamoid

QT += concurrent

RESOURCES += \
    $$PWD/gstreamer.qrc

DEFINES += USE_GSTREAMER

CONFIG += link_pkgconfig

PKGCONFIG += \
    gstreamer-1.0 \
    gstreamer-app-1.0 \
    gstreamer-audio-1.0 \
    gstreamer-video-1.0

HEADERS += \
    $$PWD/mediasink.h \
    $$PWD/outputparams.h \
    $$PWD/formatinfo.h \
    $$PWD/codecinfo.h

SOURCES += \
    $$PWD/mediasink.cpp \
    $$PWD/outputparams.cpp \
    $$PWD/formatinfo.cpp \
    $$PWD/codecinfo.cpp