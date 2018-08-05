import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_ERROR"

    Item{
        anchors.fill: parent
        Image{
            id: img
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -parent.height/5
            width: 200
            height: 200
            source:"qrc:/img/error-image.svg"
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

