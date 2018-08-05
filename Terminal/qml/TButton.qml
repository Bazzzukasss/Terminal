import QtQuick 2.0
import QtGraphicalEffects 1.0
import CustomControls 1.0

Item {
    id: root
    property TStyleItem styleItem : MyStyle.buttonDefault
    property TStyleItem styleItemDisabled : styleItem
    property TStyleItem styleItemPressed : styleItem
    property TStyleItem styleItemCurrent: enabled ? (isPressed ? styleItemPressed : styleItem) : styleItemDisabled
    property alias caption: label.text
    property alias icon: image.source
    property string key: ""
    property bool isPressed
    property string action: ""

    objectName: "BUTTON"

    signal signalClicked(string aKey)
    signal signalPressed()
    signal signalReleased()
    signal signalUIAction(string name, variant value)

    width:  styleItemCurrent.geometry[0]
    height: styleItemCurrent.geometry[1]

    Component.onCompleted: {
        if(styleItemCurrent.useIconGeometry){
            image.width = styleItemCurrent.iconGeometry[0]
            image.height = styleItemCurrent.iconGeometry[1]
            image.sourceSize.width = styleItemCurrent.iconGeometry[0]
            image.sourceSize.height = styleItemCurrent.iconGeometry[1]
            image.rotation = styleItemCurrent.iconGeometry[2]
        }
    }

    TRectangle{
        id:rect
        anchors.fill: parent
        radius: styleItemCurrent.geometry[2]
        color1: styleItemCurrent.bgColors[0]
        color2: styleItemCurrent.bgColors[1]
        border.color: styleItemCurrent.borderColor
        border.width: styleItemCurrent.borderWidth

        Image{
            id: image
            anchors.centerIn: parent
        }
        ColorOverlay {
            id: overlay
            visible: styleItemCurrent.useIconColor
            enabled: styleItemCurrent.useIconColor
            anchors.fill: image
            source: image
            color: styleItemCurrent.iconColor
        }
        TLabel{
            id: label
            anchors.centerIn: parent
            styleFont: styleItemCurrent.fonts[0]
        }
    }

    TDisabledShade {}

    MouseArea {
         anchors.fill: parent;
         onPressed: {root.signalPressed();isPressed = true}
         onReleased: {root.signalReleased();isPressed = false}
         onClicked: {
             root.signalClicked(root.key==="" ? root.caption : root.key)
             if(root.action != "")
                 root.signalUIAction( root.action, root.key )
         }
     }
}
