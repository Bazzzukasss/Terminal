import QtQuick 2.0
import "qrc:/qml"
pragma Singleton

QtObject {
	id: root

//Sizes
    readonly property int sizeH1:			56
    readonly property int sizeH2:			48
    readonly property int sizeH3:			40
    readonly property int sizeH4:			32
    readonly property int sizeH5:			24
    readonly property int sizeH6:			18
		
//Colors
    readonly property color clTransparent:  "#00000000"
    readonly property color clWhite:        "#ffffff"
    readonly property color clBlack:		"#000000"
    readonly property color clBlue:			"#1991eb"
    readonly property color clRed:			"#f85359"
    readonly property color clGreen:        "#39b54a"
    readonly property color clYellow:       "#ffff00"
    readonly property color clGrey:         "#999999"

//Fonts
	readonly property string fontFamily:		"Roboto"

    readonly property font fontH1:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH1})
    readonly property font fontH2:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH2})
    readonly property font fontH3:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH3})
    readonly property font fontH4:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH4})
    readonly property font fontH5:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH5})
    readonly property font fontH6:	Qt.font({ family: fontFamily, bold: true, pixelSize: sizeH6})


    readonly property TStyleFont fontH1Black:     TStyleFont{ font: fontH1; color: clBlack }
    readonly property TStyleFont fontH2Black:     TStyleFont{ font: fontH2; color: clBlack }
    readonly property TStyleFont fontH3Black:     TStyleFont{ font: fontH3; color: clBlack }
    readonly property TStyleFont fontH4Black:     TStyleFont{ font: fontH4; color: clBlack }
    readonly property TStyleFont fontH5Black:     TStyleFont{ font: fontH5; color: clBlack }
    readonly property TStyleFont fontH6Black:     TStyleFont{ font: fontH6; color: clBlack }

    readonly property TStyleFont fontH1White:     TStyleFont{ font: fontH1; color: clWhite }
    readonly property TStyleFont fontH2White:     TStyleFont{ font: fontH2; color: clWhite }
    readonly property TStyleFont fontH3White:     TStyleFont{ font: fontH3; color: clWhite }
    readonly property TStyleFont fontH4White:     TStyleFont{ font: fontH4; color: clWhite }
    readonly property TStyleFont fontH5White:     TStyleFont{ font: fontH5; color: clWhite }
    readonly property TStyleFont fontH6White:     TStyleFont{ font: fontH6; color: clWhite }

    readonly property TStyleFont fontLabel:         fontH2White
    readonly property TStyleFont fontStateLabel:    fontH4White
    readonly property TStyleFont fontPriceLabel:    TStyleFont{ font: fontH2; color: clYellow }


//Menu
    readonly property string menuStart: "MENU_START"

//Screen
    readonly property int screenWidth:	1024
    readonly property int screenHeight:	600

//Constants
    readonly property int timerValue: 3000

//Styles
    //Elements
    readonly property TStyleItem menu: TStyleItem {
        bgColors:       [clGrey,clBlack]
    }

    readonly property TStyleItem message: TStyleItem {
        geometry:       [904,480,20]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH2Black,fontH2White]
        size:           20
    }
    readonly property TStyleItem keyboard: TStyleItem {
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem edit: TStyleItem {
        geometry:       [0,80,20]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH2Black,fontH2White]
        borderColor:    clGrey
        borderWidth:    1
        size:           30
    }
    readonly property TStyleItem line: TStyleItem {
        bgColors:       [clGrey,clGrey]
        size:           1
    }
    //Buttons

    readonly property TStyleItem buttonCard: TStyleItem {
        geometry:       [50,50,0]
        bgColors:       [clTransparent,clTransparent]
        fonts:          [fontH2White]
        useIconGeometry: true
        iconGeometry:   [50,50,0]
    }

    readonly property TStyleItem buttonStop: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clRed,clRed]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonCorrection: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clYellow,clYellow]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonOk: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clGreen,clGreen]
        fonts:          [fontH2White]
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
    //Keyboard
    readonly property int keyHeight: 92

    readonly property TStyleItem buttonEdit: TStyleItem {
        geometry:       [40,40,0]
        useIconColor:   true
        iconColor:      clGrey
        fonts:          [fontH5Black]
    }

    readonly property TStyleItem buttonKeyboard: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardShort: TStyleItem {
        geometry:       [46,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardShift: TStyleItem {
        geometry:       [138,keyHeight,0]
        useIconColor:   true
        iconColor:      clGrey
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardWide: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardSpace: TStyleItem {
        geometry:       [426,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardCtrl: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardNum: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardNumOk: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardOk: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonDefault: TStyleItem {
        geometry:       [120,120,60]
        borderColor:    clBlack
        fonts:          [fontH5Black]
    }

    readonly property TStyleItem buttonKeyboardPressed: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardShortPressed: TStyleItem {
        geometry:       [46,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardShiftPressed: TStyleItem {
        geometry:       [138,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardWidePressed: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardSpacePressed: TStyleItem {
        geometry:       [426,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardCtrlPressed: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardNumPressed: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardNumOkPressed: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }
    readonly property TStyleItem buttonKeyboardOkPressed: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clGrey,clGrey]
        fonts:          [fontH3Black]
    }

    /*
    readonly property TStyleItem platformIndicator: TStyleItem {
        geometry:       [300,330,40]
        bgColors:       [clGreyLt,clYellow,clOrange]
        fonts:          [fontH4Grey,fontH5White]
        size:           50
    }
    readonly property TStyleItem updateIndicator: TStyleItem {
        geometry:       [350,230]
        bgColors:       [clOrange,clGrey]
    }
    readonly property TStyleItem keyboard: TStyleItem {
        bgColors:       [clGreyLtr,clGreyLtr]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem captions: TStyleItem {
        fonts:          [fontH2Black,fontH6RGreyLt,fontH4Grey,fontH5Grey,fontH3Black,fontH1Black,fontH5RGrey,fontH5Orange]
    }
    readonly property TStyleItem textedit: TStyleItem {
        geometry:       [344,350,0]
        fonts:          [fontH6RGreyLt]
    }
    readonly property TStyleItem checkbox: TStyleItem {
        geometry:       [48,48,4]
        fonts:          [fontH5Black]
        size:           50
    }
    readonly property TStyleItem itemJobList: TStyleItem {
        geometry:       [924,150,0]
        iconGeometry:   [130,130,0]
        fonts:          [fontH3Black,fontH6RGreyLt,fontH6Red,fontH6Green,fontH6Grey]
        size:           50
    }
    readonly property TStyleItem grid: TStyleItem {
        geometry:       [500,400]
        bgColors:       [clWhite,clOrange]
        fonts:          [fontH6Grey,fontH5White]
        borderColor:    clGreyLtr
    }
    readonly property TStyleItem edit: TStyleItem {
        geometry:       [0,80,20]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark,fontH3Blue]
        borderColor:    clGreyLtr
        borderWidth:    1
        size:           30
    }

    readonly property TStyleItem chart: TStyleItem {
        geometry:       [904,480,20]
        bgColors:       [clWhite,clGreyLt,clGreyLt]
        fonts:          [fontH4Black,fontH6Grey,fontH6Black]
        size:           20
    }
    readonly property TStyleItem message: TStyleItem {
        geometry:       [904,480,20]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH2Black,fontH5Grey]
        size:           20
    }
    readonly property TStyleItem progress: TStyleItem {
        geometry:       [120,120,60]
        bgColors:       [clGreyLtr,clWhite,clOrange,clGreen]
        fonts:          [fontH5Black]
        size:           32
    }

    readonly property TStyleItem threeStateSwitcher: TStyleItem {
        geometry:       [483,51,25]
        bgColors:       [clYellow,clOrange,clDark,clDark]
        fonts:          [fontH3Black,fontH5White]
        size:           80
    }
    readonly property TStyleItem itemThreeStateSwitch: TStyleItem {
        geometry:       [764,51,25]
        bgColors:       [clYellow,clOrange,clDark,clDark]
        fonts:          [fontH3Black,fontH5White]
        size:           80
    }

    readonly property TStyleItem itemSwitch: TStyleItem {
        geometry:       [322,51,25]
        bgColors:       [clYellow,clOrange,clDark,clDark]
        fonts:          [fontH3Black,fontH5White]
        size:           80
    }
    readonly property TStyleItem switcher: TStyleItem {
        geometry:       [654,64,32]
        bgColors:       [clYellow,clOrange,clDark,clDark]
        fonts:          [fontH3Black,fontH5White]
        size:           80
    }
    readonly property TStyleItem spin: TStyleItem {
        geometry:       [330,80,0]
        fonts:          [fontH3Black,fontH5Grey]
        size:           5
    }
    readonly property TStyleItem spinSmall: TStyleItem {
        geometry:       [230,50,0]
        fonts:          [fontH3Black,fontH5Grey]
    }
    readonly property TStyleItem itemSetting: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [50,50,0]
        useIconGeometry: true
        fonts:          [fontH3Black,fontH3Orange,fontH6RGreyLt,fontH3Blue,fontH3Grey]
        size:           80
    }
    readonly property TStyleItem itemSettingSmall: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [50,50,0]
        useIconGeometry: true
        fonts:          [fontH4Black,fontH4Orange,fontH6RGreyLt,fontH4Blue,fontH4Grey]
        size:           80
    }
    readonly property TStyleItem itemSettingSelection: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        iconColor:      clGreen
        useIconColor:   true
        fonts:          [fontH4Black,fontH4Orange,fontH6RGreyLt,fontH4Blue,fontH4Grey]
        size:           80
    }
    readonly property TStyleItem materialIndicator: TStyleItem {
        geometry:       [100,100,0]
        fonts:          [fontH5White,fontH6RWhite]
    }
    readonly property TStyleItem line: TStyleItem {
        bgColors:       [clGreyLtr,clGreyLtr]
        size:           1

    }
    readonly property TStyleItem connectionIndicator: TStyleItem {
        fonts:          [fontH5White,fontH6RWhite]
        size:           30
    }
    readonly property TStyleItem lefter: TStyleItem {
        geometry:       [100,0,0]
        bgColors:       [clGreyLts,clGreyLts]
    }
    readonly property TStyleItem footer: TStyleItem {
        geometry:       [0,70,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH5Grey,fontH5Red]
        size:           50
    }
    readonly property TStyleItem header: TStyleItem {
        geometry:       [0,100,60]
        bgColors:       [clDark,clDark, clYellow,clOrange, clGreen,clGreen]
        fonts:          [fontH2White]
        size:           30
    }

    //Buttons
    readonly property TStyleItem buttonDefault: TStyleItem {
        geometry:       [120,120,60]
        borderColor:    clBlack
        fonts:          [fontH5Black]
    }
    readonly property TStyleItem buttonIcon: TStyleItem {
        geometry:       [100,100,0]
        fonts:          [fontH5Dark]
    }
    readonly property TStyleItem buttonCheck: TStyleItem {
        geometry:       [100,100,0]
        fonts:          [fontH5Dark]
    }
    readonly property TStyleItem buttonIconDark: TStyleItem {
        geometry:       [150,150,0]
        fonts:          [fontH5Dark]
        useIconGeometry: true
        iconGeometry:   [150,150,0]
        useIconColor:   true
        iconColor:      clDark
    }
    readonly property TStyleItem buttonIconOrange: TStyleItem {
        geometry:       [150,150,0]
        fonts:          [fontH5Dark]
        useIconGeometry: true
        iconGeometry:   [150,150,0]
        useIconColor:   true
        iconColor:      clOrange
    }
    readonly property TStyleItem buttonEdit: TStyleItem {
        geometry:       [40,40,0]
        useIconColor:   true
        iconColor:      clDark
        fonts:          [fontH5Dark]
    }
    readonly property TStyleItem buttonSolidOrangeBig: TStyleItem {
        geometry:       [200,200,100]
        iconGeometry:   [133,133,0]
        useIconGeometry: true
        iconColor:      clWhite
        useIconColor:   true
        bgColors:       [clOrange,clOrange]
        fonts:          [fontH5White]
    }
    readonly property TStyleItem buttonEmptyBlueBig: TStyleItem {
        geometry:       [200,200,100]
        iconGeometry:   [133,133,0]
        useIconGeometry: true
        iconColor:      clBlue
        useIconColor:   true
        borderColor:    clBlue
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonSolidBlue: TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        bgColors:       [clBlue,clBlue]
        fonts:          [fontH5White]
    }
    readonly property TStyleItem buttonEmptyBlue: TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        borderColor:    clBlue
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonEmptyBlueLong: TStyleItem {
        geometry:       [330,100,50]
        borderColor:    clBlue
        fonts:          [fontH2Blue]
    }
    readonly property TStyleItem buttonSolidBlueLong: TStyleItem {
        geometry:       [290,100,50]
        bgColors:       [clBlue,clBlue]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonEmptyRed: TStyleItem {
        geometry:       [120,120,60]
        borderColor:    clRed
        fonts:          [fontH5Red]
    }
    readonly property TStyleItem buttonSolidRed: TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        bgColors:       [clRed,clRed]
        fonts:          [fontH5White]
    }
    readonly property TStyleItem buttonSolidRedLong: TStyleItem {
        geometry:       [290,100,50]
        bgColors:       [clRed,clRed]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageRed: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clRed,clRed]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageBlue: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clBlue,clBlue]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonEmptyRedLong: TStyleItem {
        geometry:       [250,50,25]
        borderColor:    clRed
        fonts:          [fontH5Red]
    }
    readonly property TStyleItem buttonEmptyGrey: TStyleItem {
        geometry:       [120,120,60]
        borderColor:    clGreyLtr
        fonts:          [fontH5GreyLtr]
    }
    readonly property TStyleItem buttonSpinBig: TStyleItem {
        geometry:       [80,80,40]
        iconGeometry:   [53,53,0]
        borderColor:    clBlue
        fonts:          [fontH5Blue]
        useIconGeometry:true
    }
    readonly property TStyleItem buttonSpinSmall: TStyleItem {
        geometry:       [50,50,25]
        iconGeometry:   [33,33,0]
        useIconGeometry: true
        borderColor:    clBlue
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonNavigate: TStyleItem {
        geometry:       [53,53,25]
        iconGeometry:   [53,53,0]
        useIconGeometry: true
        borderWidth:    1
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonSquare: TStyleItem {
        geometry:       [130,130,20]
        bgColors:       [clSlateLt,clSlateDk]
        fonts:          [fontH5Black]
        size:           17
    }
    readonly property TStyleItem buttonSquareBigGrey: TStyleItem {
        geometry:       [250,250,40]
        iconGeometry:   [200,200,0]
        useIconGeometry: true
        bgColors:       [clSlateLt,clSlateDk]
        fonts:          [fontH2Black]
        size:           25
    }
    readonly property TStyleItem buttonSquareBigOrange: TStyleItem {
        geometry:       [250,250,40]
        iconGeometry:   [200,200,0]
        useIconGeometry: true
        bgColors:       [clYellow,clOrange]
        fonts:          [fontH2Black]
        size:           25
    }
    readonly property TStyleItem buttonSquareBigRed: TStyleItem {
        geometry:       [250,250,40]
        iconGeometry:   [200,200,0]
        useIconGeometry: true
        bgColors:       [clRed,clRed]
        fonts:          [fontH2Black]
        size:           25
    }    
    readonly property TStyleItem buttonSquareSmall: TStyleItem {
        geometry:       [80,80,20]
        bgColors:       [clSlateLt,clSlateDk]
        fonts:          [fontH5Black]
        size:           10
        useIconGeometry: true
        iconGeometry:   [60,60,0]
    }
    readonly property TStyleItem buttonSquareSmallOrange: TStyleItem {
        geometry:       [80,80,20]
        bgColors:       [clYellow,clOrange]
        fonts:          [fontH5Black]
        size:           10
        useIconGeometry: true
        iconGeometry:   [60,60,0]
    }

    readonly property int keyHeight: 92

    readonly property TStyleItem buttonKeyboard: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardShort: TStyleItem {
        geometry:       [46,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardShift: TStyleItem {
        geometry:       [138,keyHeight,0]
        useIconColor:   true
        iconColor:      clDark
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardWide: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardSpace: TStyleItem {
        geometry:       [426,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardCtrl: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardNum: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardNumOk: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Blue]
    }
    readonly property TStyleItem buttonKeyboardOk: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Blue]
    }

    //Pressed
    readonly property TStyleItem itemSettingPressed: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [50,50,0]
        useIconGeometry: true
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Black,fontH3Orange,fontH6RGreyLt,fontH3Blue,fontH3Grey]
        size:           80
    }
    readonly property TStyleItem itemSettingSmallPressed: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [50,50,0]
        useIconGeometry: true
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH4Black,fontH4Orange,fontH6RGreyLt,fontH4Blue,fontH4Grey]
        size:           80
    }
    readonly property TStyleItem itemSettingSelectionPressed: TStyleItem {
        geometry:       [0,80,0]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        iconColor:      clGreen
        useIconColor:   true
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH4Black,fontH4Orange,fontH6RGreyLt,fontH4Blue,fontH4Grey]
        size:           80
    }
    readonly property TStyleItem buttonDefaultPressed: buttonDefault
    readonly property TStyleItem buttonIconPressed: buttonIcon

    readonly property TStyleItem buttonSolidBluePressed:  TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        bgColors:       [clBlueLt,clBlueLt]
        fonts:          [fontH5White]
    }
    readonly property TStyleItem buttonEmptyBluePressed: TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        bgColors:       [clGreyLts,clGreyLts]
        borderColor:    clBlue
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonEmptyBlueLongPressed: TStyleItem {
        geometry:       [330,100,50]
        borderColor:    clBlue
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH2Blue]
    }
    readonly property TStyleItem buttonSolidBlueLongPressed: TStyleItem {
        geometry:       [290,100,50]
        bgColors:       [clBlueLt,clBlueLt]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonEmptyRedPressed: TStyleItem {
        geometry:       [120,120,60]
        bgColors:       [clGreyLts,clGreyLts]
        borderColor:    clRed
        fonts:          [fontH5Red]
    }
    readonly property TStyleItem buttonEmptyRedLongPressed: TStyleItem {
        geometry:       [250,50,25]
        borderColor:    clRed
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH5Red]
    }
    readonly property TStyleItem buttonSolidRedPressed:  TStyleItem {
        geometry:       [120,120,60]
        iconGeometry:   [80,80,0]
        useIconGeometry: true
        bgColors:       [clRedLt,clRedLt]
        fonts:          [fontH5White]
    }
    readonly property TStyleItem buttonMessageRedPressed: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clRedLt,clRedLt]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonMessageBluePressed: TStyleItem {
        geometry:       [355,100,50]
        bgColors:       [clBlueLt,clBlueLt]
        fonts:          [fontH2White]
    }
    readonly property TStyleItem buttonSpinBigPressed: TStyleItem {
        geometry:       [80,80,40]
        iconGeometry:   [53,53,0]
        bgColors:       [clGreyLts,clGreyLts]
        borderColor:    clBlue
        fonts:          [fontH5Blue]
        useIconGeometry:true
    }
    readonly property TStyleItem buttonSpinSmallPressed: TStyleItem {
        geometry:       [50,50,25]
        iconGeometry:   [33,33,0]
        useIconGeometry: true
        bgColors:       [clGreyLts,clGreyLts]
        borderColor:    clBlue
        fonts:          [fontH5Blue]
    }
    readonly property TStyleItem buttonNavigatePressed: TStyleItem {
        geometry:       [53,53,25]
        iconGeometry:   [53,53,0]
        useIconGeometry: true
        borderWidth:    1
        fonts:          [fontH5Blue]
        iconColor:      clBlueLt
        useIconColor:   true
    }

    readonly property TStyleItem buttonKeyboardPressed: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardShortPressed: TStyleItem {
        geometry:       [46,keyHeight,0]
        bgColors:       [clWhite,clWhite]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardShiftPressed: TStyleItem {
        geometry:       [138,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardWidePressed: TStyleItem {
        geometry:       [92,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardSpacePressed: TStyleItem {
        geometry:       [426,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardCtrlPressed: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardNumPressed: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Dark]
    }
    readonly property TStyleItem buttonKeyboardNumOkPressed: TStyleItem {
        geometry:       [307,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Blue]
    }
    readonly property TStyleItem buttonKeyboardOkPressed: TStyleItem {
        geometry:       [250,keyHeight,0]
        bgColors:       [clGreyLts,clGreyLts]
        fonts:          [fontH3Blue]
    }
*/
 }
