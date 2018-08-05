import QtQuick 2.0
import CustomControls 1.0

Item {
    id: root
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    height: buttonStop.height

    signal signalStop()
    signal signalCorrection()
    signal signalOk();

    TButton{
        id: buttonStop
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        styleItem: MyStyle.buttonStop
        onSignalClicked: root.signalStop();
        caption: qsTr("Stop") + cppLinguist.emptyString
    }

    TButton{
        id: buttonCorrection
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        styleItem: MyStyle.buttonCorrection
        onSignalClicked: root.signalCorrection();
        caption: qsTr("Corr") + cppLinguist.emptyString
    }

    TButton{
        id: buttonOk
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        styleItem: MyStyle.buttonOk
        onSignalClicked: root.signalOk();
        caption: qsTr("Ok") + cppLinguist.emptyString
    }

}
