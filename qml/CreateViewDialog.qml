import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts

Dialog {
    id: root

    padding: 0
    closePolicy : Dialog.NoAutoClose

    header: RowLayout {
        height: 30
        Image {
            source: "qrc:/view-3.svg"
            sourceSize: Qt.size(width,height)
            Layout.margins: 10
        }

        Label {
            text:qsTr("Create View")
            Layout.fillWidth: true
        }

        Button {
            Layout.preferredWidth: 48
            Layout.preferredHeight: 48
            Layout.alignment: Qt.AlignRight

            flat: true
            icon {
                source : "qrc:/close.svg"
            }

            onClicked: root.close()
        }
    }

    Rectangle {
        id: hLine
        width: parent.width
        height: 1
        opacity: 0.4
        anchors {
            top: parent.top
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
        }
    }

    GroupBox {
        id: shortcutGrp

        height: 150
        padding: 0

        label: Label {
            text: qsTr("Shortcuts")
            opacity: 0.8
            font {
                pixelSize: 12
            }
        }

        anchors {
            top: parent.top
            topMargin: 10
            left: parent.left
            leftMargin: 25

            right: parent.right
            rightMargin: 25
        }

        GridView {
            id: gridView

            anchors.fill: parent

            cellWidth: 50
            cellHeight: 50

            model: ListModel {
                ListElement {
                    idNumber:1
                    iconSource: "qrc:/view.svg"
                }
                ListElement {
                    idNumber:2
                    iconSource: "qrc:/view-vertical.svg"
                }
                ListElement {
                    idNumber:3
                    iconSource: "qrc:/view-horizontal.svg"
                }
                ListElement {
                    idNumber:4
                    iconSource: "qrc:/view-4.svg"
                }
                ListElement {
                    idNumber:5
                    iconSource: "qrc:/view-6-reverse.svg"
                }
                ListElement {
                    idNumber:6
                    iconSource: "qrc:/view-9.svg"
                }
                ListElement {
                    idNumber:7
                    iconSource: "qrc:/view-6.svg"
                }
                ListElement {
                    idNumber:8
                    iconSource: "qrc:/view-4.svg"
                }
                ListElement {
                    idNumber:9
                    iconSource: "qrc:/view-4-reverse.svg"
                }
                ListElement {
                    idNumber:10
                    iconSource: "qrc:/view-16.svg"
                }
                ListElement {
                    idNumber:11
                    iconSource: "qrc:/view-25.svg"
                }

                ListElement {
                    idNumber:12
                    iconSource: "qrc:/view-36.svg"
                }
            }

            delegate:Item {
                width: gridView.cellWidth
                height: gridView.cellHeight
                RoundButton {
                    width: 48
                    height: 48
                    radius: 2
                    flat: true
                    //            checkable: true
                    ButtonGroup.group: btnGroup

                    icon {
                        source: model.iconSource
                    }
                    anchors.centerIn: parent
                }
            }

            ButtonGroup {
                id: btnGroup
            }
        }
    }


    Label {
        id: nameLbl

        text: qsTr("Name")
        opacity: 0.8

        anchors {
            top: shortcutGrp.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 25
        }
        font {
            pixelSize: 11
        }
    }

    TextField {
        id: nameField
        placeholderText: qsTr("Name")

        width: parent.width/2
        height: 30
        padding: 10
        bottomPadding: 5

        font {
            pixelSize: 11
        }

        anchors {
            top: nameLbl.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 25
        }

        background: Rectangle {
            color: "#4C4C4C"
            border.color: "#6C6C6C"
            radius: 5
        }
    }

    Flow {
        id: spinsFlow

        width: parent.width
        spacing: 10
        anchors {
            top:   nameField.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 25
        }

        Flow {

            width: 100
            height: 60

            Label {
                leftPadding: 10
                text: qsTr("Rows")
            }

            CustomSpinBox {
                width: 100
                height: 40
                from: 1
                to:6
                font.pixelSize: 13
            }
        }

        Flow {

            width: 100
            height: 60

            Label {
                leftPadding: 10
                text: qsTr("Columns")
            }

            CustomSpinBox {
                width: 100
                height: 40
                from: 1
                to:6
                font.pixelSize: 13
            }
        }
    }


    Rectangle {
        color: "#4C4C4C"
        border.color: "#6C6C6C"

        anchors {
            top: spinsFlow.bottom
            topMargin: 10
            bottom: createBtn.top
            bottomMargin: 10
            left: parent.left
            leftMargin: 25
            right: parent.right
            rightMargin: 25
        }
    }

    RoundButton {
        id: createBtn

        Material.background: "#1FBE72"
        text:qsTr("Create")
        radius: 5
        leftPadding: 30
        rightPadding: 30
        font {
            pixelSize: 14
            capitalization: Font.MixedCase
        }
        anchors {
            bottom: parent.bottom
            bottomMargin: 10
            right: parent.right
            rightMargin: 25
        }
    }
}
