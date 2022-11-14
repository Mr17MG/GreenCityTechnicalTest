import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Rectangle {
    color: Material.dialogColor

    ListView {
        id: listview

        clip: true
        orientation: ListView.Horizontal

        anchors {
            fill: parent
            leftMargin: 50
        }

        model: ListModel {
            ListElement {
                text: qsTr("Views")
                source: "qrc:/view-3.svg"
            }
            ListElement {
                text: qsTr("Camera")
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
