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


    function addButton( aCaption, aKey, aStyleItem, aStyleItemPressed, aAction)
    {
        var component = Qt.createComponent("TButton.qml");
        if (component.status == Component.Ready)
        {
            var button = component.createObject( buttonsConteiner, { "caption": aCaption, "key": aKey, "action": aAction, "styleItem": aStyleItem, "styleItemPressed": aStyleItemPressed } );
            if (button == null)
                console.log("Error creating button")
            else
            {
                button.signalClicked.connect(root.signalClicked)
                button.signalUIAction.connect(root.signalUIAction)
            }
        }
        else
            if (component.status == Component.Error)
                console.log("Error loading component:", component.errorString())
    }

    function deleteButtons()
    {
        for(var i = 0; i < buttonsConteiner.children.length; ++i)
            buttonsConteiner.children[i].destroy();
    }

    function setData(aDataMap, aButtonsList)
    {
        //console.log("MESSAGE EXT DATA:",aDataMap,aButtonsList);
        caption = aDataMap["caption"]
        text = aDataMap["text"]
        icon = aDataMap["icon"]

        for(var i = 0; i < aButtonsList.length; ++i)
        {
            var propertyMap = aButtonsList[i]

            var bCaption = propertyMap["caption"]
            var bKey = propertyMap["key"]
            var bMode = propertyMap["mode"]
            var bAction = propertyMap["action"]
            var bStyleItem = buttonStyles[bMode]
            var bStyleItemPressed = buttonStylesPressed[bMode]

            addButton(bCaption, bKey, bStyleItem, bStyleItemPressed, bAction)
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

            AnimatedImage{
                id: img
                visible: source!=""
                anchors.centerIn: parent
                playing: true
            }

            Image{
                id: imgSpinner
                visible: !img.visible
                anchors.centerIn: parent
                width: 128
                height: 128
                source:"qrc:/img/spinner.svg"
                RotationAnimation on rotation {
                        loops: Animation.Infinite
                        from: 0
                        to: 360
                        duration: 2000
                    }
            }
            TLabel{
                id: labelCaption
                visible: text!=""
                anchors.bottom: labelMessage.top
                anchors.horizontalCenter: parent.horizontalCenter
                styleFont:styleItem.fonts[0]
            }

            TLabel{
                id: labelMessage
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: buttonsConteiner.top
                anchors.bottomMargin: 16
                styleFont:styleItem.fonts[1]
                text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nulla \nplacerat purus turpis, ac porttitor enim sodales quis."
            }

            Column{
                id: buttonsConteiner
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 24
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 8
            }
        }
    }
    TCardEmulator{}
}
