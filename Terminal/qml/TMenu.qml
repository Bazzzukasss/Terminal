import QtQuick 2.0
import QtQuick.Controls 2.0
import CustomControls 1.0

Page {
    id: root
    objectName: "MENU"
    anchors.fill: parent

    property string name: "MENU"
    property TStyleItem styleItem: MyStyle.menu;

    signal signalGoTo(string name)
    signal signalUIParameterChaged(string name, variant value)
    signal signalUIAction(string name, variant value)
    signal signalOnEnter(string name)
    signal signalOnExit(string name)

    onVisibleChanged: {
        if(visible)
            signalOnEnter(name)
        else
            signalOnExit(name)
    }

    background: TRectangle{
        color1: styleItem.bgColors[0]
        color2: styleItem.bgColors[1]
    }
}
