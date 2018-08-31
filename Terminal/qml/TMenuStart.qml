import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_START"

    onVisibleChanged:
        cppUIPlayer.setVisible(visible)


    MouseArea{
        anchors.fill: parent
        onClicked: root.signalGoTo("MENU_CARD");
    }
}
