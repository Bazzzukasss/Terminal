import QtQuick 2.0
import CustomControls 1.0

TRectangle {
    id:root
    objectName: "KEYBOARD"
    property string name: "KEYBOARD"
    property int caseType:0
    property int keyboardType:0
    property TStyleItem styleItem: MyStyle.keyboard

    color1: styleItem.bgColors[0]
    color2: styleItem.bgColors[1]

    property var lettersLine1:[
        ["Q","W","E","R","T","Y","U","I","O","P"],
        ["q","w","e","r","t","y","u","i","o","p"]
    ]
    property var lettersLine2:[
        ["A","S","D","F","G","H","J","K","L"],
        ["a","s","d","f","g","h","j","k","l"]
    ]
    property var lettersLine3:[
        ["","Z","X","C","V","B","N","M",""],
        ["","z","x","c","v","b","n","m",""]
    ]

    property var numbersLine1:[
        ["1","2","3","4","5","6","7","8","9","0"],
        ["[","]","{","}","#","%","^","*","+","="]
    ]
    property var numbersLine2:[
        ["-","/",":",";","(",")","$","&","@","\""],
        ["_","\\","|","~","<",">","€","£","¥","•"]
    ]
    property var numbersLine3:[
        ["#+=",".",",","?","!","'",""],
        ["123",".",",","?","!","'",""],
    ]

    signal signalButtonClicked(string aKey)

    function buttonClicked( aKey )
    {
        //console.log("KEYBOARD: " + aKey);
        signalButtonClicked(aKey);
    }

    width:  MyStyle.keyboard.geometry[0]//(MyStyle.buttonKeyboard.geometry[0] + 1) * 10
    height: MyStyle.keyboard.geometry[1]//(MyStyle.buttonKeyboard.geometry[1] + 1) * 4

    Component.onCompleted:
    {
        var rows = [lettersRow1,lettersRow2,lettersRow3,lettersRow4,
                    numbersRow1,numbersRow2,numbersRow3,numbersRow4,
                    numRow1,numRow2,numRow3,numRow4];

        for(var r = 0; r < rows.length; ++r)
            for(var i = 0; i < rows[r].children.length; ++i)
            {
                if(rows[r].children[i].objectName == "BUTTON")
                {
                    //console.log(rows[r].children[i].caption);
                    rows[r].children[i].signalClicked.connect(root.buttonClicked);
                }
            }
    }

    //Letters keyboard

        Item{
            id: keyboardLetters
            visible: keyboardType == 0
            anchors.centerIn: parent
            Column{
                anchors.centerIn: parent
                spacing: 1
                Row{
                    id:lettersRow1
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children: [
                        TButtonKeyboard{caption:lettersLine1[caseType][0]},
                        TButtonKeyboard{caption:lettersLine1[caseType][1]},
                        TButtonKeyboard{caption:lettersLine1[caseType][2]},
                        TButtonKeyboard{caption:lettersLine1[caseType][3]},
                        TButtonKeyboard{caption:lettersLine1[caseType][4]},
                        TButtonKeyboard{caption:lettersLine1[caseType][5]},
                        TButtonKeyboard{caption:lettersLine1[caseType][6]},
                        TButtonKeyboard{caption:lettersLine1[caseType][7]},
                        TButtonKeyboard{caption:lettersLine1[caseType][8]},
                        TButtonKeyboard{caption:lettersLine1[caseType][9]}
                    ]
                }
                Row{
                    id:lettersRow2
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TVLine{},
                        TButtonKeyboard{caption:""; styleItem: MyStyle.buttonKeyboardShort; styleItemPressed: MyStyle.buttonKeyboardShortPressed},
                        TButtonKeyboard{caption:lettersLine2[caseType][0]},
                        TButtonKeyboard{caption:lettersLine2[caseType][1]},
                        TButtonKeyboard{caption:lettersLine2[caseType][2]},
                        TButtonKeyboard{caption:lettersLine2[caseType][3]},
                        TButtonKeyboard{caption:lettersLine2[caseType][4]},
                        TButtonKeyboard{caption:lettersLine2[caseType][5]},
                        TButtonKeyboard{caption:lettersLine2[caseType][6]},
                        TButtonKeyboard{caption:lettersLine2[caseType][7]},
                        TButtonKeyboard{caption:lettersLine2[caseType][8]},
                        TButtonKeyboard{caption:""; styleItem: MyStyle.buttonKeyboardShort; styleItemPressed: MyStyle.buttonKeyboardShortPressed}
                    ]
                }
                //THLine{}
                Row{
                    id:lettersRow3
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{
                            id: shiftLettersButton
                            caption:lettersLine3[caseType][0];
                            key:"^";
                            icon:"qrc:/img/shift.svg";
                            styleItem: MyStyle.buttonKeyboardShift
                            styleItemPressed: MyStyle.buttonKeyboardShiftPressed
                            onSignalClicked: caseType = caseType==0 ? 1 : 0
                        },
                        TButtonKeyboard{caption:lettersLine3[caseType][1]},
                        TButtonKeyboard{caption:lettersLine3[caseType][2]},
                        TButtonKeyboard{caption:lettersLine3[caseType][3]},
                        TButtonKeyboard{caption:lettersLine3[caseType][4]},
                        TButtonKeyboard{caption:lettersLine3[caseType][5]},
                        TButtonKeyboard{caption:lettersLine3[caseType][6]},
                        TButtonKeyboard{caption:lettersLine3[caseType][7]},

                        TButtonKeyboard{
                            caption:lettersLine3[caseType][8];
                            key:"<";
                            icon:"qrc:/img/backspace.svg";
                            styleItem: MyStyle.buttonKeyboardShift
                            styleItemPressed: MyStyle.buttonKeyboardShiftPressed
                        }
                    ]
                }
                Row{
                    id:lettersRow4
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"123"; styleItem: MyStyle.buttonKeyboardCtrl;styleItemPressed: MyStyle.buttonKeyboardCtrlPressed;onSignalClicked: keyboardType = keyboardType==0 ? 1 : 0},
                        TButtonKeyboard{caption:qsTr("space") + cppLinguist.emptyString; key:" "; styleItem: MyStyle.buttonKeyboardSpace;styleItemPressed: MyStyle.buttonKeyboardSpacePressed},
                        TButtonKeyboard{caption:"OK"; styleItem: MyStyle.buttonKeyboardOk;styleItemPressed: MyStyle.buttonKeyboardOkPressed}
                    ]
                }
            }
        }
    //Numbers keyboard
        Item{
            id: keyboardNumbers
            visible: keyboardType == 1
            anchors.centerIn: parent
            Column{
                anchors.centerIn: parent
                spacing: 1
                Row{
                    id: numbersRow1
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:numbersLine1[caseType][0]},
                        TButtonKeyboard{caption:numbersLine1[caseType][1]},
                        TButtonKeyboard{caption:numbersLine1[caseType][2]},
                        TButtonKeyboard{caption:numbersLine1[caseType][3]},
                        TButtonKeyboard{caption:numbersLine1[caseType][4]},
                        TButtonKeyboard{caption:numbersLine1[caseType][5]},
                        TButtonKeyboard{caption:numbersLine1[caseType][6]},
                        TButtonKeyboard{caption:numbersLine1[caseType][7]},
                        TButtonKeyboard{caption:numbersLine1[caseType][8]},
                        TButtonKeyboard{caption:numbersLine1[caseType][9]}
                    ]
                }

                Row{
                    id: numbersRow2
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:numbersLine2[caseType][0]},
                        TButtonKeyboard{caption:numbersLine2[caseType][1]},
                        TButtonKeyboard{caption:numbersLine2[caseType][2]},
                        TButtonKeyboard{caption:numbersLine2[caseType][3]},
                        TButtonKeyboard{caption:numbersLine2[caseType][4]},
                        TButtonKeyboard{caption:numbersLine2[caseType][5]},
                        TButtonKeyboard{caption:numbersLine2[caseType][6]},
                        TButtonKeyboard{caption:numbersLine2[caseType][7]},
                        TButtonKeyboard{caption:numbersLine2[caseType][8]},
                        TButtonKeyboard{caption:numbersLine2[caseType][9]}
                    ]
                }

                Row{
                    id: numbersRow3
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"";styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{
                            id: shiftNumbersButton
                            caption:numbersLine3[caseType][0];
                            key:"^";
                            //icon:"qrc:/img/shift.svg";
                            styleItem: MyStyle.buttonKeyboardShift
                            styleItemPressed: MyStyle.buttonKeyboardShiftPressed
                            onSignalClicked: caseType = caseType==0 ? 1 : 0
                        },
                        TButtonKeyboard{caption:numbersLine3[caseType][1];styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{caption:numbersLine3[caseType][2];styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{caption:numbersLine3[caseType][3];styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{caption:numbersLine3[caseType][4];styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{caption:numbersLine3[caseType][5];styleItem: MyStyle.buttonKeyboardWide},
                        TButtonKeyboard{
                            caption:numbersLine3[caseType][6];
                            key:"<";
                            icon:"qrc:/img/backspace.svg";
                            styleItem: MyStyle.buttonKeyboardShift
                            styleItemPressed: MyStyle.buttonKeyboardShiftPressed
                        },
                        TButtonKeyboard{caption:"";styleItem: MyStyle.buttonKeyboardWide}
                    ]
                }

                Row{
                    id: numbersRow4
                    spacing: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"ABC"; styleItem: MyStyle.buttonKeyboardCtrl;styleItemPressed: MyStyle.buttonKeyboardCtrlPressed;onSignalClicked: keyboardType = keyboardType==0 ? 1 : 0},
                        TButtonKeyboard{caption:qsTr("space") + cppLinguist.emptyString; key:" "; styleItem: MyStyle.buttonKeyboardSpace;styleItemPressed: MyStyle.buttonKeyboardSpacePressed},
                        TButtonKeyboard{caption:"OK"; styleItem: MyStyle.buttonKeyboardOk;styleItemPressed: MyStyle.buttonKeyboardOkPressed}
                    ]
                }
            }
        }

    //Numerical keyboard
        Item{
            id: keyboardNumerical
            visible: keyboardType == 2
            anchors.centerIn: parent
            Column{
                anchors.centerIn: parent
                spacing: 16
                Row{
                    id: numRow1
                    spacing: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"1"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"2"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"3"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed}
                    ]
                }
                Row{
                    id: numRow2
                    spacing: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"4"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"5"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"6"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed}
                    ]
                }
                Row{
                    id: numRow3
                    spacing: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"7"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"8"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"9"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed}
                    ]
                }
                Row{
                    id: numRow4
                    spacing: 17
                    anchors.horizontalCenter: parent.horizontalCenter
                    children:[
                        TButtonKeyboard{caption:"<"; key:"<"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"0"; styleItem: MyStyle.buttonKeyboardNum;styleItemPressed: MyStyle.buttonKeyboardNumPressed},
                        TButtonKeyboard{caption:"OK"; styleItem: MyStyle.buttonKeyboardNumOk;styleItemPressed: MyStyle.buttonKeyboardNumOkPressed}
                    ]
                }
            }
        }
}
