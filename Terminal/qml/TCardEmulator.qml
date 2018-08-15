import QtQuick 2.0
import CustomControls 1.0

Rectangle{
    id: debug
    enabled: cppUIAssistant.isDebugVersion()
    visible: enabled
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height:16
    color: "#e6b900"
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
