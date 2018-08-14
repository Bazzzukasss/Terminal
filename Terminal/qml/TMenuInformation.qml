import QtQuick 2.0
import CustomControls 1.0

TMenu{
    id: root
    name:"MENU_INFORMATION"

    onVisibleChanged:{
        if(visible)
            timer.start()
        else
            timer.stop()
    }

    Timer{
        id: timer
        interval: 15000
        onTriggered: root.signalGoTo("MENU_START");
    }

    Image{
        anchors.centerIn: parent
        source:"qrc:/img/bg-information.png"
    }

    TLabel{
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        styleFont: MyStyle.fonts[3]
        text: qsTr("Allow us to keep you updated\non this, and other exciting\nnew developments")+cppLinguist.emptyString
    }

    Image{
        id: img
        anchors.top: parent.top
        anchors.topMargin: 168
        anchors.horizontalCenter: parent.horizontalCenter
        width: 168
        height: 168
        source:"qrc:/img/qr.svg"
    }

    TLabel{
        anchors.top: parent.top
        anchors.topMargin: 410
        anchors.horizontalCenter: parent.horizontalCenter
        styleFont: MyStyle.fonts[5]
        text: qsTr("Done")+cppLinguist.emptyString
        MouseArea{
            anchors.fill: parent
            onClicked: root.signalGoTo("MENU_START");
        }
    }
}

