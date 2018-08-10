import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_CARD"

    QtObject{
        id: data
        property var modeImages: ["qrc:/img/card-none.svg","qrc:/img/card-nfc.svg","qrc:/img/card-chip.svg","qrc:/img/card-stripe.svg"]
        property string selectedModeImage: modeImages[cppUIController.cardMode]
        property string cardState: cppUIController.cardState
        property real price: cppUIController.price
        property string productName: cppUIController.productName
    }

    onVisibleChanged: {
        if(visible)
        {
            cppUIController.setCardMode(0);
            cppUIController.setCardState("Payment method");
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
    Item{
        anchors.fill: parent
        Image{
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            source:"qrc:/img/bg-header.svg"
        }

        TLabel{
            id: productNameLabel
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[2]
            text: data.productName
        }

        TLabel{
            id: priceLabel
            anchors.top: parent.top
            anchors.topMargin: 164
            anchors.horizontalCenter: parent.horizontalCenter
            styleFont: MyStyle.fonts[0]
            text: data.price
        }

        TLabel{
            id: stateLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 121
            styleFont: MyStyle.fonts[3]
            text: data.cardState
        }



        TButton{
            id: buttonCardChip
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 32
            anchors.left: parent.left
            anchors.leftMargin: 16
            icon: data.modeImages[2]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIController.setCardMode(2);
                cppUIController.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }

        TButton{
            id: buttonCardStripe
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 32
            anchors.horizontalCenter: parent.horizontalCenter
            icon: data.modeImages[3]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIController.setCardMode(3);
                cppUIController.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }
        TButton{
            id: buttonCardNFC
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 32
            anchors.right: parent.right
            anchors.rightMargin: 16
            icon: data.modeImages[1]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIController.setCardMode(1);
                cppUIController.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }




        TButton{
            id: buttonPay
            visible: cppUIController.cardMode != 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
            styleItem: MyStyle.buttonYellow
            caption: qsTr("Pay") + cppLinguist.emptyString
            onSignalClicked: root.signalGoTo("MENU_PIN");
        }

    }

}
