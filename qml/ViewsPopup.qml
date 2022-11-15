import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts

Popup {
    id: root

    Component.onCompleted: {
        createBtn.clicked()
    }

    visible: true
    modal: false
    padding: 0
    closePolicy: Popup.NoAutoClose

    background: Rectangle {
        id: backgroundRectangle

        color: "#212121"
        radius: 4
    }

    Rectangle { //remove bottom-left and bottom-right radius
        height: backgroundRectangle?.radius ?? 0
        width: parent.width
        color: backgroundRectangle?.color ?? ""
        anchors {
            bottom: parent.bottom
        }
    }

    RowLayout {
        id: headerLayout

        spacing: 0
        width: parent.width
        height: 48

        Label {
            Layout.fillWidth: true
            Layout.leftMargin: 12
            Layout.topMargin: 12
            Layout.bottomMargin: 12

            text: qsTr("Views")

            font {
                pixelSize: 20
            }
        }

        Button {
            flat: true

            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 38
            Layout.preferredHeight: 48

            topInset: 0
            bottomInset: 0
            leftInset: 0
            rightInset: 0
            padding: 12
            rightPadding: 6
            leftPadding:  6

            icon {
                width: 24
                height: 24
                source: "qrc:/refresh.svg"
            }
        }

        Button {
            id: closeBtn
            flat: true

            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 38
            Layout.preferredHeight: 48

            topInset: 0
            bottomInset: 0
            leftInset: 0
            rightInset: 0
            padding: 12
            leftPadding:  6

            icon {
                width: 24
                height: 24
                source: "qrc:/close.svg"
            }
        }
    }

    Rectangle {
        id: hLine
        width: parent.width
        height: 1
        opacity: 0.05
        anchors {
            top: headerLayout.bottom
            topMargin: 5
            horizontalCenter: parent.horizontalCenter
        }
    }

    TextField {
        id: nameField
        placeholderText: qsTr("Name")
        placeholderTextColor: "#808080"
        height: 40
        padding: 12
        bottomPadding: 6

        font {
            pixelSize: 13
        }

        anchors {
            top: hLine.bottom
            topMargin: 12
            left: parent.left
            leftMargin: 12
            right: parent.right
            rightMargin: 12
        }

        background: Rectangle {
            color: "#333333"
            border.color: "#4C4C4C"
            radius: 6
        }
    }

    Button {
        id: createBtn

        text: qsTr("Create view")
        flat: true
        highlighted: true
        height: 24
        width: 106
        padding: 0
        topInset: 0
        bottomInset: 0
        leftInset: 0
        rightInset: 0

        spacing: 11

        icon {
            width: 12
            height: 12
            source: "qrc:/plus.svg"
        }

        font {
            capitalization: Font.MixedCase
            pixelSize: 15
        }

        anchors {
            top: nameField.bottom
            topMargin: 12
            left: parent.left
            leftMargin: 12
        }

        onClicked: {
            var component = Qt.createComponent("qrc:/CreateViewDialog.qml")
            if(component.status === Component.Ready)
            {
                var dialog = component.createObject(mainWindow)
                dialog.width = 380
                dialog.height = 752
                dialog.x = (mainWindow.width + root.width - dialog.width) / 2
                dialog.y = (mainWindow.height + mainWindow.header.height - dialog.height) / 2
                dialog.open()
            }
            else
                console.error(component.errorString())
        }

    }

    ListView {
        id: listview
        spacing: 4
        clip: true
        width: parent.width

        anchors {
            top: createBtn.bottom
            topMargin: 16
            bottom: parent.bottom
        }

        model: ListModel {
            id: viewsModel
            ListElement {
                viewName: "New view"
                isFavorite: false
                iconSource: "view-4-reverse.svg"
            }
            ListElement {
                viewName: "Hemmat highway"
                isFavorite: true
                iconSource: "view-vertical.svg"
            }
            ListElement {
                viewName: "Imam ali street"
                isFavorite: false
                iconSource: "view-36.svg"
            }
            ListElement {
                viewName: "Hashemi Rafsanjani"
                isFavorite: false
                iconSource: "view-6.svg"
            }
        }

        delegate: Rectangle {
            width: listview.width
            height: 48
            color: "#262626"

            Image {
                id: iconImg
                width: 24
                height: 24
                source: model.iconSource
                sourceSize: Qt.size(width,height)

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 12
                }
            }

            Label {
                text: model.viewName
                elide: Qt.ElideRight

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: iconImg.right
                    leftMargin: 10.5
                    right: favBtn.left
                }
            }

            Button {
                id: favBtn

                flat:true

                width: 48
                height: 48

                padding: 12
                topInset: 0
                bottomInset: 0
                leftInset: 0
                rightInset: 0

                icon {
                    source: model.isFavorite ? "qrc:/star-fill.svg"
                                             : "qrc:/star.svg"
                    color: model.isFavorite ? "#1FBE72"
                                            : "#6C6C6C"
                }


                anchors {
                    verticalCenter: parent.verticalCenter
                    right: menuBtn.left
                }

                onClicked: {
                    viewsModel.setProperty(model.index, "isFavorite", !model.isFavorite)
                }
            }

            Button {
                id: menuBtn

                flat:true

                width: 48
                height: 48

                padding: 12

                topInset: 0
                bottomInset: 0
                leftInset: 0
                rightInset: 0

                opacity: 0.4

                icon {
                    width: 24
                    height: 24
                    source: "qrc:/dots.svg"
                }

                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }
            }

        }
    }
}
