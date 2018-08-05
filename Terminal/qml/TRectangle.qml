import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    property alias color1: gPoint1.color
    property alias color2: gPoint2.color
    property double position1: 0.0
    property double position2: 1.0

    clip: true

    gradient: Gradient {
       GradientStop {id: gPoint1; position: position1;}
       GradientStop {id: gPoint2; position: position2;}
    }
}
