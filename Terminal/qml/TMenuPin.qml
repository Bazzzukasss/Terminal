import QtQuick 2.0

TMenu{
    id: root
    name:"MENU_PIN"

    Item{
        anchors.fill: parent

        TFooter{
            isBackButton: true
            onSignalBack: root.signalGoTo("MENU_CARD")
            onSignalOk:{
                if(cppUIController.isPinGood(""))
                    root.signalGoTo("MENU_SUCCESS")
                else
                    root.signalGoTo("MENU_ERROR")
            }
        }
    }
}
