import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts


Rectangle {
    color: "#212121"

    Rectangle { // remove radius of top-left
        color: parent.color
        height: parent.radius
        width: parent.radius
    }

    Rectangle { // remove radius of bottom-right
        color: parent.color
        height: parent.radius
        width: parent.radius

        anchors {
            right: parent.right
            bottom: parent.bottom
        }
    }

    Rectangle { // resize radius of top-right
        color: parent.color
        height: parent.radius
        width: parent.radius
        radius: 4

        anchors {
            right: parent.right
        }
    }


    Column {
        id: topColumn
        spacing: 0

        anchors {
            top: parent.top
        }

        SideButton {
            id: arrowBtn
            icon {
                source: "qrc:/arrow.svg"
            }
            Material.background: "transparent"
        }

        SideButton {
            id: searchBtn
            icon {
                source: "qrc:/search.svg"
            }
        }
    }

    Column {
        spacing: 4
        anchors {
            top: topColumn.bottom
            topMargin: 47
        }

        SideButton {
            icon {
                source: "qrc:/view-3.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/camera.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/inbox.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/map.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/layout.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/reports.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/menu-circle.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/play.svg"
            }
        }
        SideButton {
            icon {
                source: "qrc:/setting.svg"
            }
        }

        SideButton {
            icon {
                source: "qrc:/door.svg"
            }
        }

    }

    SideButton {
        id: shapeBtn

        icon {
            source: "qrc:/shape.svg"
        }
        anchors {
            bottom: iconBtn.top
            bottomMargin: 29
        }
    }

    SideButton {
        id: iconBtn

        icon {
            width: 32
            height: 32
            color: "#13EC91"
            source: "qrc:/icon.svg"
        }

        anchors {
            bottom: parent.bottom
            bottomMargin: 40
        }
    }
}
