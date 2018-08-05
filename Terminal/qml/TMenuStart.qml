import QtQuick 2.0

TMenu{
    id: root
    name:"MENU_START"

    Item{
        anchors.fill: parent
        Image{
            id: img
            anchors.centerIn: parent
            source:"qrc:/img/start-image.png"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: root.signalGoTo("MENU_CARD");
        }
    }
}
