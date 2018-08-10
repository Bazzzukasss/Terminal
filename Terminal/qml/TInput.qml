import QtQuick 2.0
import CustomControls 1.0

Item {
    id: root
    objectName: "INPUT"
    property string name: "INPUT"
    property string value
    property int maxValueLength: 4
    property string currentMenu
    property alias keyboardType: keyboard.keyboardType

    signal signalApplyValue(string aValue);

    function setValue(aValue)
    {
        value = aValue;
        edit.text = aValue;
    }

    function clearValue()
    {
        value = ""
        edit.text = value;
    }

    function backSpace()
    {
        value = value.substring(0,value.length-1);
        edit.text = value;
    }

    function keyboardButtonClicked(aKey)
    {
        switch(aKey)
        {
            case "^":
            case "123":
            case "ABC":
                break;

            case "OK":
                signalApplyValue(value);
                break;

            case "<":
                value = value.substring(0,value.length-1);
                break;

            default:
                if(value.length < maxValueLength)
                    value += aKey
                break;
        }
        edit.text = value;
    }

    Component.onCompleted: edit.text = value;

    Item{
        anchors.fill: parent

        TMaskEdit{
            id: edit
            anchors.bottom: keyboard.top
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }
        TKeyboard{
            id: keyboard
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onSignalButtonClicked: root.keyboardButtonClicked(aKey);

        }
    }
}
