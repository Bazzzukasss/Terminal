import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_WAIT"

    TRectangle{
        anchors.fill: parent
        color1: MyStyle.clYellowLt
        color2: MyStyle.clYellowLt
        Image{
            id: img
            anchors.centerIn: parent
            width: 128
            height: 128
            source:"qrc:/img/spinner.svg"
            RotationAnimation on rotation {
                    loops: Animation.Infinite
                    from: 0
                    to: 360
                    duration: 2000
                }
            onRotationChanged: {
                if(rotation > 350 && visible)
                {
                    if(cppUIBackend.checkPinCode("1111"))
                        root.signalGoTo("MENU_SUCCESS");
                    else
                        root.signalGoTo("MENU_ERROR");
                }
            }

        }
        TLabel{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 24
            styleFont: MyStyle.fonts[3]
            text: qsTr("Please, waiting.\nTransaction is in process.")+cppLinguist.emptyString
        }
    }
}
