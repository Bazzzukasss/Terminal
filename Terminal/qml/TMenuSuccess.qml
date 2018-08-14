import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_SUCCESS"

    Item{
        id: proc
        property bool isCardPresent: cppUIBackend.isCardPresent

        onIsCardPresentChanged: {
            if(!isCardPresent && root.visible)
                root.signalGoTo("MENU_INFORMATION");
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
        source:"qrc:/img/success-image.svg"
    }

    TLabel{
        id: labelDescription
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 200
        anchors.horizontalCenter: parent.horizontalCenter
        styleFont: MyStyle.fonts[0]
        text: qsTr("Payment\nAccepted")+cppLinguist.emptyString
    }

    Image{
        id: imageCardChip
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 67
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/img/card-chip.svg"
    }

    TLabel{
        id: labelInfo
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.horizontalCenter: parent.horizontalCenter
        styleFont: MyStyle.fonts[3]
        text: qsTr("Take back your card")+cppLinguist.emptyString
    }

    Item{
        id: debug
        enabled: !cppUIAssistant.isReleaseVersion()
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height:16
        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            onClicked: {
                if(mouse.button & Qt.RightButton)
                    cppUIBackend.isCardPresent = false;
                else
                    cppUIBackend.isCardPresent = true;
            }
        }
    }
}
