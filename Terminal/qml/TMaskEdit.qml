import QtQuick 2.0
import CustomControls 1.0

TRectangle{
    id: root
    property TStyleItem styleItem: MyStyle.maskEdit
    property string text: ""

    width:  styleItem.geometry[0]
    height: styleItem.geometry[1]
    radius: styleItem.geometry[2]

    color1: styleItem.bgColors[0]
    color2: styleItem.bgColors[1]

    border.color: styleItem.borderColor
    border.width: styleItem.borderWidth

    Row{
        anchors.fill: parent
        spacing: 24
        TMaskIndicator{ isActive: root.text.length >=1 }
        TMaskIndicator{ isActive: root.text.length >=2 }
        TMaskIndicator{ isActive: root.text.length >=3 }
        TMaskIndicator{ isActive: root.text.length >=4 }
    }

}
