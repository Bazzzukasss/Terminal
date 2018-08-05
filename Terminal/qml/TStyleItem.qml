import QtQuick 2.0

QtObject {
    property color iconColor:   "#00000000" //used if useIconColor = true
    property color borderColor:	"#00000000"

    property int size:          1
    property int borderWidth:   1

    property bool useIconGeometry: false
    property bool useIconColor: false

    property var bgColors:["#00000000","#00000000"]
    property var geometry:[100,100,50]//width,height,radius
    property var iconGeometry:[]//width,height,rotation; used if useIconGeometry = true
    property var fonts:[]
}
