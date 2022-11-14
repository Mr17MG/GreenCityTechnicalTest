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
        implicitWidth: 30
        implicitHeight: 30
        color: control.up.pressed ? "#4C4C4C" : "#6C6C6C"
        radius: width

        Text {
            text: "+"
            font.pixelSize: control.font.pixelSize * 3
            color: "#DDDDDD"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    down.indicator: Rectangle {
        x: control.mirrored ? parent.width - width - 5 : 5
        y: (parent.height - height)/2
        implicitWidth: 30
        implicitHeight: 30
        color: control.down.pressed ? "#4C4C4C" : "#6C6C6C"
        radius: width

        Text {
            text: "-"
            font.pixelSize: control.font.pixelSize * 3
            color: "#DDDDDD"
            anchors.fill: parent
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    background: Rectangle {
        implicitWidth: 150
        radius: 48
        color:"#2C2C2C"
    }
}
