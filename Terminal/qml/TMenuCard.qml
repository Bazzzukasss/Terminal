import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_CARD"

    onSignalOnEnter: cppUIBackend.refreshData();

    onVisibleChanged:{
        if(visible)
        {
            timerToBack.start()
            timerToNext.start()
        }
        else
        {
            timerToBack.stop()
            timerToNext.stop()
        }
    }    

    Item{
        id: proc
        property bool isCardPresent: cppUIBackend.isCardPresent

        onIsCardPresentChanged: {
            if(isCardPresent && root.visible)
                root.signalGoTo("MENU_PIN");
        }

        Timer{
            id: timerToBack
            interval: 30000
            onTriggered:{
                if(!cppUIBackend.isCardPresent)
                    root.signalGoTo("MENU_START");
            }
        }

        Timer{
            id: timerToNext
            interval: 2000
            onTriggered:{
                if(cppUIBackend.isCardPresent)
                    root.signalGoTo("MENU_PIN");
            }
        }
    }

    Image{
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        source:"qrc:/img/bg-header.svg"
    }

    Image{
        anchors.top: parent.top
        anchors.topMargin: 88
        anchors.horizontalCenter: parent.horizontalCenter
        source:"qrc:/img/logo.svg"
    }

    TLabel{
        id: priceLabel
        anchors.centerIn: parent
        styleFont: MyStyle.fonts[0]
        text: cppUIBackend.productPrice + qsTr(" EUR") + cppLinguist.emptyString
    }

    TLabel{
        id: stateLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 121
        styleFont: MyStyle.fonts[3]
        text: qsTr("Present Card")+cppLinguist.emptyString
    }

    Image{
        id: imageCardChip
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.left: parent.left
        anchors.leftMargin: 16
        source: "qrc:/img/card-chip.svg"
    }
    Image{
        id: imageCardStripe
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        source: "qrc:/img/card-stripe.svg"
    }
    Image{
        id:imageCardNFC
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 32
        anchors.right: parent.right
        anchors.rightMargin: 16
        source: "qrc:/img/card-nfc.svg"
    }

    TCardEmulator{}
}
