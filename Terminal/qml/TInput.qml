import QtQuick 2.0
import CustomControls 1.0

Item {
    id: root
    objectName: "INPUT"
    property string name: "INPUT"
    property string value
    property string currentMenu
    property alias keyboardType: keyboard.keyboardType
    property alias okButtonCaption: keyboard.okButtonCaption
    property alias isButtonOk: keyboard.isButtonOk
    property alias isSmartButtons: edit.isSmartButtons

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
            case okButtonCaption:
                signalApplyValue(value);
                break;

            case "<":
                value = value.substring(0,value.length-1);
                break;

            default:
                value += aKey
                break;
        }
        edit.text = value;
    }

    Component.onCompleted: edit.text = value;

    Column{
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: MyStyle.isBigScreen ? 60 : 26
        TEdit{
            id: edit
            onSignalClear: root.clearValue()
            onSignalBackspace: root.backSpace()
            mode: keyboardType === 2 ? 1 : 0
        }
        TKeyboard{
            id: keyboard
            anchors.horizontalCenter: parent.horizontalCenter
            onSignalButtonClicked: root.keyboardButtonClicked(aKey);

        }
    }
}
