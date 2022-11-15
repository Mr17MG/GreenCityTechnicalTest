import QtQuick

Rectangle {
    id: root

    required property color backgroundColor
    property var callback

    color: backgroundColor
    width: 8
    height: 8
    radius: 8

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onClicked: {
            callback()
        }

        onEntered: {
            root.color = Qt.darker(backgroundColor)
        }

        onExited: {
            root.color = backgroundColor
        }
    }
}
