import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_SUCCESS"

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
            if(cppUIController.isCardPresent)
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
    Column{
        anchors.fill: parent
        anchors.topMargin: 96
        Image{
            id: img
            width: 80
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter
            source:"qrc:/img/success-image.svg"
        }
        Item{height: 24; width:1}
        TLabel{
            id: labelDescription
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[0]
            text: qsTr("Payment\nAccepted")+cppLinguist.emptyString
        }
        Item{height: 16; width:1}
        TLabel{
            id: labelInfo
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[3]
            text: qsTr("Other detailed information\nabout transaction")+cppLinguist.emptyString
        }
        Item{height: 66; width:1}
        TButton{
            id: buttonOk
            anchors.horizontalCenter: parent.horizontalCenter
            styleItem: MyStyle.buttonYellow
            styleItemPressed: MyStyle.buttonYellowPressed
            caption: qsTr("Ok") + cppLinguist.emptyString
            onSignalClicked: root.signalGoTo("MENU_INFORMATION");
        }
    }
}
