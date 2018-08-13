import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_ERROR"

    onVisibleChanged:{
        if(visible)
            timer.start()
        else
            timer.stop()
    }

    Timer{
        id: timer
        interval: MyStyle.timerValue;
        onTriggered:{
            if(cppUIBackend.isCardPresent)
                root.signalGoTo("MENU_CARD");
            else
                root.signalGoTo("MENU_START");
        }

    }
    TRectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 150
        color1: MyStyle.clTransparent
        color2: MyStyle.clDark
    }

    Image{
        id: img
        width: 80
        height: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 304
        anchors.horizontalCenter: parent.horizontalCenter
        source:"qrc:/img/error-image.svg"
    }

    TLabel{
        id: labelDescription
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 200
        anchors.horizontalCenter: parent.horizontalCenter
        styleFont: MyStyle.fonts[0]
        text: qsTr("Payment\nFailed")+cppLinguist.emptyString
    }

    TButton{
        id: buttonOk
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 24
        anchors.horizontalCenter: parent.horizontalCenter
        styleItem: MyStyle.buttonYellow
        styleItemPressed: MyStyle.buttonYellowPressed
        caption: qsTr("Ok") + cppLinguist.emptyString
        onSignalClicked: root.signalGoTo("MENU_START");
    }
}
