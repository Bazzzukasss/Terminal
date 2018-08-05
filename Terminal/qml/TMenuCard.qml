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
    }

    Item{
        anchors.fill: parent
        TButton{
            id: buttonCardNFC
            anchors.left: parent.left
            anchors.top: parent.top
            icon: data.modeImages[1]
            styleItem: MyStyle.buttonCard
            onSignalClicked: root.signalUIAction("actionCardNFCSelected","")
        }

        TButton{
            id: buttonCardChip
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            icon: data.modeImages[2]
            styleItem: MyStyle.buttonCard
            onSignalClicked: root.signalUIAction("actionCardChipSelected","")
        }

        TButton{
            id: buttonCardStripe
            anchors.right: parent.right
            anchors.top: parent.top
            icon: data.modeImages[3]
            styleItem: MyStyle.buttonCard
            onSignalClicked: root.signalUIAction("actionCardStripeSelected","")
        }

        Image{
            id: modeImage
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: priceLabel.top;
            anchors.bottomMargin: 10
            height: 100
            width: height
            source: data.selectedModeImage
        }

        TLabel{
            id: priceLabel
            anchors.centerIn: parent
            styleFont: MyStyle.fontPriceLabel
            text: data.price
        }

        TLabel{
            id: stateLabel
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: priceLabel.bottom
            anchors.topMargin: 10
            styleFont: MyStyle.fontStateLabel
            text: data.cardState
        }

        TFooter{
            onSignalStop:{
                root.signalUIAction("actionPaymentStop","")
                root.signalGoTo("MENU_START")
            }

            onSignalCorrection:{
                root.signalUIAction("actionPaymentCorrection","")
            }

            onSignalOk:{
                root.signalUIAction("actionPaymentOk","")
                root.signalGoTo("MENU_PIN")
            }
        }
    }

}
