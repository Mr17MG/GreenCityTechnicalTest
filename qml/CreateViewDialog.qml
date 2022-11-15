import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts

Dialog {
    id: root

    background: Rectangle {
        color: "#212121"
        radius: 4
    }

    padding: 0
    topInset: 0
    bottomInset: 0
    closePolicy : Dialog.NoAutoClose

    header:Item {
        height: 48
        width: parent.width

        RowLayout {
            anchors.fill: parent

            Image {
                source: "qrc:/view-3.svg"
                sourceSize: Qt.size(width,height)
                Layout.leftMargin: 14
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
            }

            Label {
                text:qsTr("Create View")
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                font.bold: true
            }

            Button {
                Layout.preferredWidth: 48
                Layout.preferredHeight: 48
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

                flat: true
                padding: 0

                topInset: 0
                bottomInset: 0
                rightInset: 0
                leftInset: 0

                icon {
                    width: 24
                    height: 24
                    source : "qrc:/close.svg"
                }

                onClicked: root.close()
            }

        }

        Rectangle {
            id: hLine
            width: parent.width
            height: 1
            opacity: 0.05
            anchors {
                bottom: parent.bottom
                bottomMargin: -4
            }
        }
    }


    Label {
        id: shortcutLbl

        text: qsTr("Shortcuts")
        color: "#999999"
        horizontalAlignment: Label.AlignHCenter

        font {
            pixelSize: 13
        }

        anchors {
            top: parent.top
            left: parent.left
            leftMargin: 36
        }
    }

    Rectangle {
        id: shortcutGrp

        height: 124

        color: "#262626"
        border.color: "#212121"
        radius: 4


        anchors {
            top: shortcutLbl.bottom
            topMargin: 4
            left: parent.left
            leftMargin: 24

            right: parent.right
            rightMargin: 24
        }

        GridView {
            id: gridView

            anchors {
                fill: parent
                margins: 12
            }

            interactive: false

            cellWidth: 51
            cellHeight: 51


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

                    ButtonGroup.group: btnGroup

                    padding: 0
                    Material.background: checked ? "#4C4C4C"
                                                 : "#333333"

                    topInset: 0
                    bottomInset: 0
                    leftInset: 0
                    rightInset: 0

                    checkable: true

                    icon {
                        width: 32
                        height: 32
                        source: model.iconSource
                        color: "#ACACAC"
                    }

                    anchors {
                        centerIn: parent
                    }
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
        color:"#999999"
        leftPadding: 12
        anchors {
            top: shortcutGrp.bottom
            topMargin: 4
            left: parent.left
            leftMargin: 36
        }

        font {
            pixelSize: 13
        }
    }

    TextField {
        id: nameField
        placeholderText: qsTr("Name")
        placeholderTextColor: "#737373"

        width: 168
        height: 24
        padding: 12
        bottomPadding: 4
        topPadding: 4

        font {
            pixelSize: 13
        }

        anchors {
            top: nameLbl.bottom
            topMargin: 4
            left: parent.left
            leftMargin: 36
        }

        background: Rectangle {
            color: "#333333"
            border.color: "#4C4C4C"
            radius: 6
        }
    }

    Flow {
        id: spinsFlow

        width: parent.width
        spacing: 24

        anchors {
            top:   nameField.bottom
            topMargin: 10
            left: parent.left
            leftMargin: 25
        }

        Flow {

            width: 89
            height: 56

            Label {
                leftPadding: 12
                text: qsTr("Rows")
                font.pixelSize: 13
                color: "#999999"
            }

            CustomSpinBox {
                width: 89
                height: 36
                from: 1
                to:6
                font.pixelSize: 11
            }
        }

        Flow {

            width: 89
            height: 56

            Label {
                leftPadding: 12
                text: qsTr("Columns")
                font.pixelSize: 13
                color: "#999999"
            }

            CustomSpinBox {
                width: 89
                height: 36
                from: 1
                to:6
                font.pixelSize: 11
            }
        }
    }


    Rectangle {
        color: "#262626"
        border.color: "#4C4C4C"

        width: 332
        height: 332
        radius: 4

        anchors {
            top: spinsFlow.bottom
            topMargin: 12
            left: parent.left
            leftMargin: 24
        }
    }

    RoundButton {
        id: createBtn

        width: 116
        height: 40

        Material.background: "#1FBE72"
        text: qsTr("Create")
        radius: 4

        topInset: 0
        bottomInset: 0
        rightInset: 0
        leftInset: 0

        font {
            pixelSize: 17
            capitalization: Font.MixedCase
        }

        anchors {
            bottom: parent.bottom
            bottomMargin: 24
            right: parent.right
            rightMargin: 24
        }
    }
}
