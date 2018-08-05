import QtQuick 2.0
import CustomControls 1.0

Item {
	id: root
	property TStyleItem styleItem: MyStyle.edit
	property alias text: value.text
	property int mode: 1
    property bool isSmartButtons: true

    signal signalClear()
	signal signalBackspace()

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: styleItem.size
    anchors.rightMargin: styleItem.size    

    width: styleItem.geometry[0]
    height: styleItem.geometry[1]
	QtObject {
		id: priv
		property int margin: 30
	}

	TRectangle{
		anchors.fill: parent
        color1: styleItem.bgColors[0]
        color2: styleItem.bgColors[1]
        radius: styleItem.geometry[2]
        border.color: styleItem.borderColor
        border.width: styleItem.borderWidth

		TLabel{
			id:value
			anchors.verticalCenter: parent.verticalCenter
			anchors.left: parent.left
			anchors.leftMargin: priv.margin
			width: parent.width-anchors.leftMargin-(btnClr.visible
				? btnClr.width + btnClr.anchors.rightMargin + btnClr.anchors.leftMargin
				: btnBsp.width + btnBsp.anchors.rightMargin + btnBsp.anchors.leftMargin);
				text:"text"
			horizontalAlignment: Text.AlignLeft
			wrapMode: Text.NoWrap
			elide: Text.ElideLeft
			styleFont: styleItem.fonts[0]
		}

		TButton{
			id:btnClr
            visible: !mode && value.text!="" && isSmartButtons
            styleItem: MyStyle.buttonEdit
            styleItemPressed: MyStyle.buttonEdit
			anchors.verticalCenter: parent.verticalCenter
			anchors.right: parent.right
			anchors.rightMargin: priv.margin
			anchors.leftMargin: priv.margin
            icon: "qrc:/img/clear.svg"
			onSignalClicked: root.signalClear()
		}

		TButton{
			id:btnBsp
            visible: mode && value.text!="" && isSmartButtons
            styleItem: MyStyle.buttonEdit
            styleItemPressed: MyStyle.buttonEdit
			anchors.verticalCenter: parent.verticalCenter
			anchors.right: parent.right
			anchors.rightMargin: priv.margin
			anchors.leftMargin: priv.margin
            icon: "qrc:/img/backspace.svg"
			onSignalClicked: root.signalBackspace();
		}
	}
}
