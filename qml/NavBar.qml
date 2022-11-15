import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Rectangle {

    color: "#212121"

    MouseArea {
        id: iMouseArea

        property int prevX: mainWindow.x
        property int prevY: mainWindow.y

        anchors.fill: parent

        onPressed: {
            prevX = mouseX
            prevY = mouseY
        }

        onPositionChanged: {
            var deltaX = mouseX - prevX;
            mainWindow.x += deltaX;
            prevX = mouseX - deltaX;

            var deltaY = mouseY - prevY
            mainWindow.y += deltaY;
            prevY = mouseY - deltaY;
        }
    }

    Rectangle {
        id: squareRect
        z:-1
        color: parent.color
        height: parent.radius

        anchors {
            bottom: parent.bottom
            right: parent.right
            left: parent.left
        }
    }

    Flow {

        spacing: 4

        anchors {
            top: parent.top
            topMargin: 14
            bottom: parent.bottom
            bottomMargin: 18
            left: parent.left
            leftMargin: 23
        }

        WindowButton {
            backgroundColor: "#FD5B4C"
            callback: function() {
                Qt.quit()
            }
        }

        WindowButton {
            backgroundColor:  "#FFBD39"
            callback: function() {
               showMinimized()
            }
        }

        WindowButton {
            backgroundColor:  "#1FBE72"
            callback: function() {
                if(mainWindow.visibility === Window.Maximized)
                    showNormal()
                else
                    showMaximized()
            }
        }
    }

    ListView {
        id: listview

        clip: true
        orientation: ListView.Horizontal
        interactive: false

        anchors {
            fill: parent
            leftMargin: 93
        }

        model: ListModel {
            ListElement {
                text: qsTr("Views")
                source: "qrc:/view-3.svg"
            }
            ListElement {
                text: qsTr("Cameras")
                source: "qrc:/camera.svg"
            }

            ListElement {
                text: qsTr("Maps")
                source: "qrc:/map.svg"
            }

            ListElement {
                text: qsTr("Hemmat highway")
                source: "qrc:/view-3.svg"
            }

            ListElement {
                text: qsTr("Imam ali street")
                source: "qrc:/view-36.svg"
            }

            ListElement {
                text: qsTr("Reports")
                source: "qrc:/reports.svg"
            }
        }

        delegate: NavButton {
            text: model.text
            height: 40
            highlighted: model.index === listview.currentIndex

            icon {
                source: model.source
            }

            onClicked: {
                listview.currentIndex = model.index
            }
        }

    }

}
