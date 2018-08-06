import QtQuick 2.0
import CustomControls 1.0

Item {
    id: root
    property string name: "MESSAGE"
    objectName: "MESSAGE"
    property TStyleItem styleItem: MyStyle.message
    property var buttonStyles: [MyStyle.buttonMessageStandart,MyStyle.buttonMessageImportant]
    property var buttonStylesPressed: [MyStyle.buttonMessageStandartPressed,MyStyle.buttonMessageImportantPressed]
    property int type: 2
    property alias icon : img.source
    property alias caption : labelCaption.text
    property alias text: labelMessage.text
    property string currentMenu

    signal signalClicked( string aButton )
    signal signalUIAction(string name, variant value)
    z:1
    anchors.fill: parent


    function addButton( aCaption, aKey, aStyleItem, aStyleItemPressed, aWidth, aAction)
    {
        var component = Qt.createComponent("TButton.qml");
        if (component.status === Component.Ready)
        {
            var button = component.createObject( buttonsRow, { "caption": aCaption, "key": aKey, "action": aAction, "width": aWidth,  "styleItem": aStyleItem, "styleItemPressed": aStyleItemPressed } );
            if (button === null)
                console.log("Error creating button")
            else
            {
                button.signalClicked.connect(root.signalClicked)
                button.signalUIAction.connect(root.signalUIAction)
            }
        }
        else
            if (component.status === Component.Error)
                console.log("Error loading component:", component.errorString())
    }

    function deleteButtons()
    {
        for(var i = 0; i < buttonsRow.children.length; ++i)
            buttonsRow.children[i].destroy();
    }

    function setData(aDataMap, aButtonsList)
    {
        //console.log("MESSAGE EXT DATA:",aDataMap,aButtonsList);
        caption = aDataMap["caption"]
        text = aDataMap["text"]
        icon = aDataMap["icon"]

        var bWidth = messageRect.width / (aButtonsList.length + 1)
        for(var i = 0; i < aButtonsList.length; ++i)
        {
            var propertyMap = aButtonsList[i]

            var bCaption = propertyMap["caption"]
            var bKey = propertyMap["key"]
            var bMode = propertyMap["mode"]
            var bAction = propertyMap["action"]
            var bStyleItem = buttonStyles[bMode]
            var bStyleItemPressed = buttonStylesPressed[bMode]

            addButton(bCaption, bKey, bStyleItem, bStyleItemPressed, bWidth, bAction)
        }
    }

    onVisibleChanged: {
        if(!visible)
            deleteButtons();
    }

    Rectangle{
        anchors.fill: parent
        color:"#363f4f"

        TRectangle{
            id: messageRect
            anchors.centerIn: parent
            width: styleItem.geometry[0]
            height:styleItem.geometry[1]
            color1:styleItem.bgColors[0]
            color2:styleItem.bgColors[1]
            position1: 0.4
            border.color: styleItem.borderColor
            border.width: styleItem.borderWidth
            radius: styleItem.geometry[2]

            Column{
                anchors.centerIn: parent
                spacing: styleItem.size
                AnimatedImage{
                    id: img
                    anchors.horizontalCenter: parent.horizontalCenter
                    playing: true
                }

                TLabel{
                    id: labelCaption
                    anchors.horizontalCenter: parent.horizontalCenter
                    styleFont:styleItem.fonts[0]
                }

                TLabel{
                    id: labelMessage
                    anchors.horizontalCenter: parent.horizontalCenter
                    styleFont:styleItem.fonts[1]
                    text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nulla \nplacerat purus turpis, ac porttitor enim sodales quis."
                }
                Item{height: 1;width:1}
                Row{
                    id: buttonsRow
                    spacing:50
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
