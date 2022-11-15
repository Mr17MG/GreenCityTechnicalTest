import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

SpinBox {
    id: control

    editable: true

    contentItem: TextInput {
        z: 2
        text: control.textFromValue(control.value, control.locale)

        font: control.font
        color: "#FFFFFF"
        selectionColor: "#6c6c6c"
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
        height: parent.height
       anchors.centerIn: parent
    }

    up.indicator: Rectangle {
        x: control.mirrored ? 5 : parent.width - width - 5
        y: (parent.height - height)/2
        implicitWidth: 24
        implicitHeight: 24
        color: control.up.pressed ? "#212121" : "#363636"
        radius: width
        border.color: "#4C4C4C"

        Image {
            source: "qrc:/plus-2.svg"
            anchors.centerIn: parent
            width: 14
            height: 14
            sourceSize: Qt.size(width,height)
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width - 5 : 5
        y: (parent.height - height)/2
        implicitWidth: 24
        implicitHeight: 24
        color: control.down.pressed ? "#212121" : "#363636"
        radius: width
        border.color: "#4C4C4C"
        Image {
            source: "qrc:/minus.svg"
            anchors.centerIn: parent
            width: 14
            height: 3.5
            sourceSize: Qt.size(width,height)
        }
    }

    background: Rectangle {
        implicitWidth: 150
        radius: 48
        color:"#191919"
    }
}
