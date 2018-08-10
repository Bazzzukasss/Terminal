import QtQuick 2.0
import CustomControls 1.0

TRectangle {
    property bool isActive: false
    property TStyleItem styleItem: MyStyle.maskInicator
    property TStyleItem styleItemActive : MyStyle.maskInicatorActive
    property TStyleItem styleItemCurrent : isActive ? styleItemActive :styleItem

    width:  styleItemCurrent.geometry[0]
    height: styleItemCurrent.geometry[1]
    radius: styleItemCurrent.geometry[2]

    color1: styleItemCurrent.bgColors[0]
    color2: styleItemCurrent.bgColors[1]

    border.color: styleItemCurrent.borderColor
    border.width: styleItemCurrent.borderWidth
}
