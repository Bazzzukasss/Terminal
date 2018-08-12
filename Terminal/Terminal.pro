QT += quick widgets
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    cpp/Linguist.cpp \
    cpp/main.cpp \
    cpp/UILogic.cpp \
    cpp/UIAssistant.cpp \
    cpp/UIBackend.cpp \
    cpp/Core.cpp \
    cpp/CoreEmulator.cpp \
    cpp/UIMessenger.cpp

RESOURCES += \
    res.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    qml/main.qml \
    qml/TButton.qml \
    qml/TKeyboard.qml \
    qml/TLabel.qml \
    qml/TMenu.qml \
    qml/TRectangle.qml \
    qml/TStyle.qml \
    qml/TStyleFont.qml \
    qml/TStyleItem.qml \
    qml/TMenuStart.qml \
    qml/TMenuCard.qml \
    qml/TMenuPin.qml \
    qml/TMenuSuccess.qml \
    qml/TMenuError.qml \
    qml/TMenuInformation.qml \
    qml/TMessage.qml \
    qml/TDisabledShade.qml \
    qml/TEdit.qml \
    qml/TInput.qml \
    qml/TVLine.qml \
    qml/TButtonKeyboard.qml \
    qml/TLine.qml \
    qml/TMaskEdit.qml \
    qml/TMaskIndicator.qml

HEADERS += \
    cpp/Linguist.h \
    cpp/UILogic.h \
    cpp/UIAssistant.h \
    cpp/UIBackend.h \
    cpp/Core.h \
    cpp/CoreEmulator.h \
    cpp/UIMessenger.h
