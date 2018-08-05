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

    Item{
        anchors.fill: parent
        Image{
            id: img
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -parent.height/5
            width: 200
            height: 200
            source:"qrc:/img/information-image.svg"
        }
        TButton{
            id: buttonOk
            anchors.centerIn: parent
            anchors.verticalCenterOffset: parent.height/4
            styleItem: MyStyle.buttonOk
            onSignalClicked: root.signalGoTo("MENU_START");
            caption: qsTr("Ok") + cppLinguist.emptyString
        }
    }
}

