import QtQuick 2.0
import "qrc:/qml"
pragma Singleton

QtObject {
	id: root

//Sizes
    readonly property int sizeH1:			32
    readonly property int sizeH2:			24
    readonly property int sizeH3:			16
		
//Colors

    readonly property color clTransparent:  "#00000000"
    readonly property color clBlack:        "#000000"
    readonly property color clWhite:        "#ffffff"
    readonly property color clDark:         "#dfe3e9"
    readonly property color clGrey:         "#dfdfdf"

    readonly property color clRedDk:        "#cd080f"
    readonly property color clRedLt:        "#f85359"

    readonly property color clYellowDk:     "#e6b900"
    readonly property color clYellowLt:     "#ffcd00"

    readonly property color clGreyDk:       "#231f20"
    readonly property color clGreyLt:       "#555a60"

//Fonts
    readonly property font fontH1b: Qt.font({ family: "Roboto-Black", bold: true, pixelSize: sizeH1})
    readonly property font fontH2b: Qt.font({ family: "Roboto", bold: true, pixelSize: sizeH2})
    readonly property font fontH3b: Qt.font({ family: "Roboto", bold: true, pixelSize: sizeH3})
    readonly property font fontH3r: Qt.font({ family: "Roboto", bold: false, pixelSize: sizeH3})

    readonly property TStyleFont fontH1bDk:  TStyleFont{ font: fontH1b; color: clGreyDk }
    readonly property TStyleFont fontH2bDk:  TStyleFont{ font: fontH2b; color: clGreyDk }
    readonly property TStyleFont fontH3bDk:  TStyleFont{ font: fontH3b; color: clGreyLt }
    readonly property TStyleFont fontH3rDk:  TStyleFont{ font: fontH3r; color: clGreyLt }
    readonly property TStyleFont fontH3rLt:  TStyleFont{ font: fontH3r; color: clWhite }

    readonly property var fonts: [fontH1bDk,fontH2bDk,fontH3bDk,fontH3rDk,fontH3rLt]

//Menu
    readonly property string menuStart: "MENU_PIN"

//Screen
    readonly property int screenWidth:	272
    readonly property int screenHeight:	480

//Constants
    readonly property int timerValue: 3000

//Styles
    //Elements
    readonly property TStyleItem menu: TStyleItem {
        bgColors:       [clWhite,clWhite]
    }
    readonly property TStyleItem keyboard: TStyleItem {
        geometry:       [226,305,0]
        bgColors:       [clTransparent,clTransparent]
        fonts:          [fontH1bDk]
    }
    readonly property TStyleItem maskEdit: TStyleItem {
        geometry:       [136,16,0]
        bgColors:       [clWhite,clWhite]
    }
    readonly property TStyleItem maskInicator: TStyleItem {
        geometry:       [16,16,8]
        bgColors:       [clWhite,clWhite]
        borderColor:    clGreyLt
        borderWidth:    1
    }
    readonly property TStyleItem maskInicatorActive: TStyleItem {
        geometry:       [16,16,8]
        bgColors:       [clGreyLt,clGreyLt]
        borderColor:    clGreyLt
        borderWidth:    1
    }
    readonly property TStyleItem line: TStyleItem {
        bgColors:       [clBlack,clWhite]
        size:           1
    }

    //Buttons
    readonly property TStyleItem buttonDefault: TStyleItem {
        geometry:       [120,120,60]
        borderColor:    clBlack
        fonts:          [fontH2bDk]
    }
    readonly property TStyleItem buttonYellow: TStyleItem {
        geometry:       [240,56,14]
        bgColors:       [clYellowLt,clYellowLt]
        fonts:          [fontH2bDk]
    }
    readonly property TStyleItem buttonYellowPressed: TStyleItem {
        geometry:       [240,56,14]
        bgColors:       [clYellowDk,clYellowDk]
        fonts:          [fontH2bDk]
    }
    readonly property TStyleItem buttonCard: TStyleItem {
        geometry:       [64,64,0]
        bgColors:       [clTransparent,clTransparent]
        fonts:          [fontH2bDk]
        useIconGeometry: true
        iconGeometry:   [64,64,0]
    }
    readonly property TStyleItem buttonRedRound: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clRedLt,clRedLt]
        fonts:          [fontH2bDk]
    }
    readonly property TStyleItem buttonRedRoundPressed: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clRedDk,clRedDk]
        fonts:          [fontH2bDk]
    }

    readonly property TStyleItem buttonYellowRound: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clYellowLt,clYellowLt]
        fonts:          [fontH2bDk]
    }
    readonly property TStyleItem buttonYellowRoundPressed: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clYellowDk,clYellowDk]
        fonts:          [fontH2bDk]
    }

    //Keyboard
    readonly property int keySize: 64
    readonly property TStyleFont keyFont: fontH1bDk

    readonly property TStyleItem buttonEdit: TStyleItem {
        geometry:       [40,40,0]
        useIconColor:   true
        iconColor:      clDark
        fonts:          [keyFont]
    }
    readonly property TStyleItem buttonKeyboard: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clWhite,clWhite]
        fonts:          [keyFont]
        borderColor:    clGrey
        borderWidth:    1
    }
    readonly property TStyleItem buttonKeyboardShort: buttonKeyboard
    readonly property TStyleItem buttonKeyboardShift: buttonKeyboard
    readonly property TStyleItem buttonKeyboardWide: buttonKeyboard
    readonly property TStyleItem buttonKeyboardSpace: buttonKeyboard
    readonly property TStyleItem buttonKeyboardCtrl: buttonKeyboard
    readonly property TStyleItem buttonKeyboardNum: buttonKeyboard
    readonly property TStyleItem buttonKeyboardNumOk: buttonKeyboard
    readonly property TStyleItem buttonKeyboardOk: buttonKeyboard
    readonly property TStyleItem buttonKeyboardPressed: TStyleItem {
        geometry:       [keySize,keySize,keySize/2]
        bgColors:       [clGrey,clGrey]
        fonts:          [keyFont]
        borderColor:    clGrey
        borderWidth:    1
    }
    readonly property TStyleItem buttonKeyboardShortPressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardShiftPressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardWidePressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardSpacePressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardCtrlPressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardNumPressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardNumOkPressed: buttonKeyboardPressed
    readonly property TStyleItem buttonKeyboardOkPressed: buttonKeyboardPressed
/*
    readonly property TStyleItem message: TStyleItem {
        geometry:       [904,480,20]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH2Black,fontH2White]
        size:           20
    }

    readonly property TStyleItem buttonMessageImportant: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clRed,clRed]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageStandart: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clBlue,clBlue]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageImportantPressed: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageStandartPressed: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH2White]
    }
    */
 }
