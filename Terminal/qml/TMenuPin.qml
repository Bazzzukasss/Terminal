import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_PIN"
    onVisibleChanged: input.clearValue();

    Item{
        anchors.fill: parent
        property bool isCardPresent: cppUIBackend.isCardPresent
        onIsCardPresentChanged: {
            if( !isCardPresent && root.visible)
                root.signalGoTo("MENU_ERROR")
        }

        TLabel{
            id: labelCaption
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 32
            styleFont: MyStyle.fonts[1]
            text: qsTr("Enter PIN code")
        }

        TRectangle{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 150
            color1: MyStyle.clTransparent
            color2: MyStyle.clDark
        }

        TInput{
            id: input
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 24
            anchors.rightMargin: 24
            anchors.bottomMargin: 32
            keyboardType: 2

            TButton{
                id: buttonBackspace
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                icon: input.value.length > 0 ? "qrc:/img/backspace.svg" : "qrc:/img/error-image.svg"
                styleItem: MyStyle.buttonRedRound
                styleItemPressed: MyStyle.buttonRedRoundPressed
                onSignalClicked: input.value.length > 0 ? input.backSpace() : root.signalGoTo("MENU_ERROR")
            }

            TButton{
                id: buttonNext
                enabled: input.value.length==4
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                icon: "qrc:/img/next-image.svg"
                styleItem: MyStyle.buttonYellowRound
                styleItemPressed: MyStyle.buttonYellowRoundPressed
                onSignalClicked: {
                    console.log("Pay Button pressed")
                    if(cppUIBackend.doPayment(input.value))
                        root.signalGoTo("MENU_SUCCESS");
                    else
                        root.signalGoTo("MENU_ERROR");
                }
            }
        }
    }

    TCardEmulator{}
}
