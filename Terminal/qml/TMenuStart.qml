import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_START"

    Item{
        anchors.fill: parent
        Image{
            id: img
            anchors.centerIn: parent
            source:"qrc:/img/bg-start.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: root.signalGoTo("MENU_CARD");
        }
    }
}
