import QtQuick 2.0
import QtQuick.Controls 2.0

Label{
    id: root
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    wrapMode: Text.WordWrap
    property TStyleFont styleFont

    font: styleFont.font
    color: styleFont.color
}
