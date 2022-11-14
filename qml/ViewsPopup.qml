import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts

Popup {
    id: root
    Component.onCompleted: {
        createBtn.clicked()
    }

    RowLayout {
        id: headerLayout
        spacing: 0
        width: parent.width
        height: 40
        Label {
            Layout.fillWidth: true
            text: qsTr("Views")
        }

        Button {
            flat: true
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            icon {
                source: "qrc:/refresh.svg"
            }
        }

        Button {
            flat: true
            padding: 0
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 40
            Layout.preferredHeight: 40
            icon {
                source: "qrc:/close.svg"
            }
        }
    }

    Rectangle {
        id: hLine
        width: parent.width
        height: 1
        opacity: 0.4
        anchors {
            top: headerLayout.bottom
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
        }
    }

    TextField {
        id: nameField
        placeholderText: qsTr("Name")

        width: parent.width
        height: 40
        padding: 10

        font {
            pixelSize: 11
        }

        anchors {
            top: hLine.bottom
            topMargin: 5
        }

        background: Rectangle {
            color: "#4C4C4C"
            border.color: "#6C6C6C"
            radius: 5
        }
    }

    Button {
        id: createBtn
        text: qsTr("Create view")
        flat: true
        highlighted: true


        icon {
            width: 12
            height: 12
            source: "qrc:/plus.svg"
        }

        font {
            capitalization: Font.MixedCase
            pixelSize: 13
        }

        anchors {
            top: nameField.bottom
            topMargin: 5
        }

        onClicked: {
            var component = Qt.createComponent("qrc:/CreateViewDialog.qml")
            if(component.status === Component.Ready)
            {
                var dialog = component.createObject(mainWindow)
                dialog.width = 350
                dialog.height = 620
                dialog.x = (mainWindow.width+root.width-dialog.width)/2
                dialog.y = (mainWindow.height+mainWindow.header.height-dialog.height)/2
                dialog.open()
            }
            else
                console.error(component.errorString())
        }

    }

    ListView {
        id: listview
        spacing: 2
        clip: true
        width: parent.width

        anchors {
            top: createBtn.bottom
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
            color: model.index%2===0?"#474747":"transparent"
            Image {
                id: iconImg
                width: 24
                height: 24
                source: model.iconSource
                sourceSize: Qt.size(width,height)

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 5
                }
            }

            Label {
                text: model.viewName
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: iconImg.right
                    leftMargin: 5
                }
            }

            Button {
                id: favBtn
                flat:true
                width: 48
                height: 48
                icon {
                    source: model.isFavorite ? "qrc:/star-fill.svg"
                                             : "qrc:/star.svg"
                    color: model.isFavorite ? "#1FBE72"
                                            : "#6C6C6C"
                }

                anchors {
                    verticalCenter: parent.verticalCenter
                    right: menuBtn.left
                    rightMargin: 5
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
                icon{
                    source: "qrc:/dots.svg"
                }

                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 5
                }
            }
        }
    }


    visible: true
    modal: false
    closePolicy: Popup.NoAutoClose

}
