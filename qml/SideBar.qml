import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import QtQuick.Layouts


Rectangle {
    color: Material.dialogColor

    ColumnLayout {
        anchors.fill: parent

        Column {
            spacing: 0

            SideButton {
                id: arrowBtn
                icon {
                    width: 10
                    height: 16
                    source: "qrc:/arrow.svg"
                }
            }

            SideButton {
                id: searchBtn
                icon {
                    source: "qrc:/search.svg"
                }
            }
        }

        Column {
            spacing: 0

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
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            icon {
                source: "qrc:/shape.svg"
            }
        }

        SideButton {
            id: iconBtn
            Layout.fillWidth: true
            Layout.preferredHeight: 48
            icon {
                color: "#13EC91"
                source: "qrc:/icon.svg"
            }
        }
    }
}
