import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_INFORMATION"

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

    Image{
        anchors.centerIn: parent
        source:"qrc:/img/bg-information.png"
    }

    Column{
        anchors.fill: parent
        anchors.topMargin: 54
        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[1]
            text: qsTr("Like what you see?")+cppLinguist.emptyString
        }
        Item{height: 16; width:1}
        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[3]
            text: qsTr("To stay informed about\nnext development")+cppLinguist.emptyString
        }
        Item{height: 16; width:1}
        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[2]
            text: qsTr("Scan the code")+cppLinguist.emptyString
        }
        Item{height: 38; width:1}
        Image{
            id: img
            anchors.horizontalCenter: parent.horizontalCenter
            width: 168
            height: 168
            source:"qrc:/img/qr.svg"
        }
        Item{height: 35; width:1}
        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[1]
            text: qsTr("Done")+cppLinguist.emptyString
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: root.signalGoTo("MENU_START");
    }
}

