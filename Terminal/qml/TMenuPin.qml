import QtQuick 2.0

TMenu{
    id: root
    name:"MENU_PIN"

    Item{
        anchors.fill: parent

        TInput{
            id: input
            anchors.fill: parent
            keyboardType: 2
            isButtonOk: false
            isSmartButtons: false
        }
/*
        TFooter{
            id: footer
            isBackButton: true
            onSignalBack: root.signalGoTo("MENU_CARD")
            onSignalCorrection: input.backSpace()
            onSignalOk:{
                if(cppUIController.isPinGood(input.value))
                    root.signalGoTo("MENU_SUCCESS")
                else
                    root.signalGoTo("MENU_ERROR")
                input.clearValue()
            }
        }
        */
    }
}
