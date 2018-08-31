import QtQuick 2.0
import CustomControls 1.0
//import QtMultimedia 5.0

TMenu{
    id: root
    name:"MENU_START"

    onVisibleChanged:
    {
        /*
        if(visible)
            video.play()
        else
            video.stop()
            */
    }

    Item{
        id: videoRect
        anchors.fill: parent

        Rectangle{
            anchors.fill: parent
            color: "#000000"
            /*
            Video {
                id: video
                visible: cppUIAssistant.isFileExists("video.avi")
                width : parent.width
                height : parent.height
                source: "file:video.avi"
                autoPlay: visible
                autoLoad: true
                muted: true
                loops: MediaPlayer.Infinite
                anchors.centerIn: parent
            }
            */
        }

        AnimatedImage{
            id: video
            source: "file:video.gif"
            visible: cppUIAssistant.isFileExists("video.gif")
            anchors.fill: parent
            playing: true
        }

        Image{
            id: img
            visible: !video.visible
            anchors.centerIn: parent
            source:"qrc:/img/bg-start.png"
        }

        MouseArea{
            anchors.fill: parent
            onClicked: root.signalGoTo("MENU_CARD");
        }
    }
}
