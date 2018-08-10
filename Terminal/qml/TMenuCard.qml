import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_CARD"

    QtObject{
        id: data
        property var modeImages: ["qrc:/img/card-none.svg","qrc:/img/card-nfc.svg","qrc:/img/card-chip.svg","qrc:/img/card-stripe.svg"]
        property string selectedModeImage: modeImages[cppUIBackend.cardMode]
        property string cardState: cppUIBackend.cardState
        property real price: cppUIBackend.price
        property string productName: cppUIBackend.productName
        property var buttons: [buttonCardChip,buttonCardStripe,buttonCardNFC]
        property var selectedButton: buttons[cppUIBackend.cardMode-1]
    }

    onVisibleChanged: {
        if(visible)
        {
            cppUIBackend.setCardMode(0);
            cppUIBackend.setCardState("Payment method");
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
            visible: cppUIBackend.cardMode == 0 || cppUIBackend.cardMode == 1
            x: 16
            y: 384
            icon: data.modeImages[2]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIBackend.setCardMode(1);
                cppUIBackend.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }
        TButton{
            id: buttonCardStripe
            visible: cppUIBackend.cardMode == 0 || cppUIBackend.cardMode == 2
            x: 104
            y: 384
            icon: data.modeImages[3]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIBackend.setCardMode(2);
                cppUIBackend.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }
        TButton{
            id: buttonCardNFC
            visible: cppUIBackend.cardMode == 0 || cppUIBackend.cardMode == 3
            x: 192
            y: 384
            icon: data.modeImages[1]
            styleItem: MyStyle.buttonCard
            onSignalClicked: {
                cppUIBackend.setCardMode(3);
                cppUIBackend.setCardState(qsTr("Selected payment method")+cppLinguist.emptyString);
            }
        }


        TButton{
            id: buttonPay
            visible: cppUIBackend.cardMode != 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
            styleItem: MyStyle.buttonYellow
            caption: qsTr("Pay") + cppLinguist.emptyString
            onSignalClicked: root.signalGoTo("MENU_PIN");
        }

        states:[
            State { name: "nocard"; when: cppUIBackend.cardMode == 0;
                PropertyChanges { target: data.buttons[0]; x:16; y: 384 }
                PropertyChanges { target: data.buttons[1]; x:104; y: 384 }
                PropertyChanges { target: data.buttons[2]; x:192; y: 384 }
            },
            State { name: "card"; when: cppUIBackend.cardMode != 0;
                PropertyChanges { target: data.selectedButton; x:104; y: 260 }

            }
        ]
    }

}
