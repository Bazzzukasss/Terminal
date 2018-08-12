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

        TRectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 150
            color1: MyStyle.clTransparent
            color2: MyStyle.clBlack
            Image{
                id: imageNext
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.rightMargin: 32
                anchors.bottomMargin: 32
                width: 64
                height: 64
                source:"qrc:/img/next-image.svg"
            }
            TLabel{
                anchors.verticalCenter: imageNext.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 32
                horizontalAlignment: Text.AlignLeft
                styleFont: MyStyle.fonts[4]
                text: qsTr("Press anywhere\nto start")+cppLinguist.emptyString
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked: root.signalGoTo("MENU_CARD");
        }
    }
}
