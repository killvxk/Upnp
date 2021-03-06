#-------------------------------------------------
#
# Project created by QtCreator 2017-02-04T11:49:54
#
#-------------------------------------------------

QT       -= gui
QT       += network xml

TARGET = UpnpLibrary
TARGET = $$qtLibraryTarget($$TARGET)

TEMPLATE = lib
CONFIG += staticlib

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT

!exists($$(MYLIBRARY)) {
    error("variable MYLIBRARY not set.")
}

INCLUDEPATH += $$(MYLIBRARY)/$$QT_VERSION/include/QmlApplication
LIBS += -L$$(MYLIBRARY)/$$QT_VERSION -l$$qtLibraryTarget(QmlApplication)

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += upnplibrary.cpp \
    upnpcontrolpoint.cpp \
    ssdpmessage.cpp \
    upnprootdevice.cpp \
    upnpservice.cpp \
    upnpdevice.cpp \
    upnpobject.cpp \
    upnptimer.cpp \
    upnperror.cpp \
    Http/httpserver.cpp \
    Http/httprequest.cpp \
    soapaction.cpp \
    soapactionresponse.cpp \
    didllite.cpp \
    Http/elapsedtimer.cpp \
    eventresponse.cpp \
    statevariableitem.cpp \
    Http/httprange.cpp

HEADERS += upnplibrary.h \
    upnpcontrolpoint.h \
    ssdpmessage.h \
    upnprootdevice.h \
    upnpservice.h \
    upnpdevice.h \
    upnpobject.h \
    upnptimer.h \
    upnperror.h \
    Http/httpserver.h \
    Http/httprequest.h \
    soapaction.h \
    soapactionresponse.h \
    didllite.h \
    Http/elapsedtimer.h \
    eventresponse.h \
    statevariableitem.h \
    Http/httprange.h

DISTFILES += \
    doc/AVTransport/UPnP-av-AVTransport-v1-Service-20020625.pdf \
    doc/AVTransport/UPnP-av-AVTransport-v1-Service-AnnexA-20101006.pdf \
    doc/AVTransport/UPnP-av-AVTransport-v2-Service-20080930.pdf \
    doc/AVTransport/UPnP-av-AVTransport-v2-Service-AnnexA-20101006 2.pdf \
    doc/AVTransport/UPnP-av-AVTransport-v2-Service-AnnexA-20101006.pdf \
    doc/AVTransport/UPnP-av-AVTransport-v3-Service-20130331.pdf \
    doc/ConnectionManager/UPnP-av-ConnectionManager-v1-Service-20020625.pdf \
    doc/ConnectionManager/UPnP-av-ConnectionManager-v1-Service-AnnexA-20101006.pdf \
    doc/ConnectionManager/UPnP-av-ConnectionManager-v2-Service-20060531.pdf \
    doc/ConnectionManager/UPnP-av-ConnectionManager-v2-Service-AnnexA-20101006.pdf \
    doc/ConnectionManager/UPnP-av-ConnectionManager-v3-Service-20130331.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v1-Service-20020625.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v1-Service-AnnexA-20101006.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v2-Service-20060531.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v2-Service-AnnexA-20101006.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v3-Service-20080930.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v3-Service-AnnexA-20101006.pdf \
    doc/ContentDirectory/UPnP-av-ContentDirectory-v4-Service-20150319.pdf \
    doc/DeviceArchitecture/UPnP-arch-DeviceArchitecture-v1.0-20081015.pdf \
    doc/DeviceArchitecture/UPnP-arch-DeviceArchitecture-v1.1-20081015.pdf \
    doc/DeviceArchitecture/UPnP-arch-DeviceArchitecture-v1.1-AnnexA-20110315.pdf \
    doc/DeviceArchitecture/UPnP-arch-DeviceArchitecture-v2.0-20150220.pdf \
    doc/MediaRenderer/UPnP-av-MediaRenderer-v1-Device-20020625.pdf \
    doc/MediaRenderer/UPnP-av-MediaRenderer-v2-Device-20080930.pdf \
    doc/MediaRenderer/UPnP-av-MediaRenderer-v3-Device-20130331.pdf \
    doc/MediaServer/UPnP-av-MediaServer-v1-Device-20020625.pdf \
    doc/MediaServer/UPnP-av-MediaServer-v2-Device-20060531.pdf \
    doc/MediaServer/UPnP-av-MediaServer-v3-Device-20080930.pdf \
    doc/MediaServer/UPnP-av-MediaServer-v4-Device-20130331.pdf \
    doc/RenderingControl/UPnP-av-RenderingControl-v1-Service-20020625.pdf \
    doc/RenderingControl/UPnP-av-RenderingControl-v1-Service-AnnexA-20101006.pdf \
    doc/RenderingControl/UPnP-av-RenderingControl-v2-Service-20060531.pdf \
    doc/RenderingControl/UPnP-av-RenderingControl-v2-Service-AnnexA-20101006.pdf \
    doc/RenderingControl/UPnP-av-RenderingControl-v3-Service-20130331.pdf \
    doc/AVTransport/AVTransport1.SyntaxTests.xml \
    doc/AVTransport/AVTransport2.SyntaxTests.xml \
    doc/ConnectionManager/ConnectionManager1.SyntaxTests.xml \
    doc/ConnectionManager/ConnectionManager1.xml \
    doc/ConnectionManager/ConnectionManager2.SyntaxTests.xml \
    doc/ConnectionManager/ConnectionManager2.xml \
    doc/ContentDirectory/ContentDirectory1.SyntaxTests.xml \
    doc/ContentDirectory/ContentDirectory1.xml \
    doc/ContentDirectory/ContentDirectory2.SyntaxTests.xml \
    doc/ContentDirectory/ContentDirectory2.xml \
    doc/ContentDirectory/ContentDirectory3.SyntaxTests.xml \
    doc/ContentDirectory/ContentDirectory3.xml \
    doc/MediaRenderer/MediaRenderer1.xml \
    doc/MediaRenderer/MediaRenderer2.xml \
    doc/MediaServer/MediaServer1.xml \
    doc/MediaServer/MediaServer2.xml \
    doc/MediaServer/MediaServer3.xml \
    doc/RenderingControl/RenderingControl1.SyntaxTests.xml \
    doc/RenderingControl/RenderingControl1.xml \
    doc/RenderingControl/RenderingControl2.SyntaxTests.xml \
    doc/RenderingControl/RenderingControl2.xml

installPath = $$(MYLIBRARY)/$$QT_VERSION
target.path = $$installPath
INSTALLS += target

installIncludePath = $$installPath/include/UpnpLibrary

h_include.files = *.h
h_include.path = $$installIncludePath
INSTALLS += h_include

http.files = Http/*.h
http.path = $$installIncludePath/Http
INSTALLS += http
