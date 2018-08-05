import QtQuick 2.0
import CustomControls 1.0

TRectangle {
	objectName: "LINE"
	property TStyleItem styleItem: MyStyle.line;
	property int size: styleItem.size

    color1: styleItem.bgColors[0]
    color2: styleItem.bgColors[1]
}
