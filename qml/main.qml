import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {
    id: mainWindow
    width: 1440
    height: 900
    minimumHeight: 750
    visible: true
    title: qsTr("GreenCity Technical Test")

    Material.theme: Material.Dark
    Material.primary: "#1FBE72"
    Material.accent: "#1FBE72"

    flags: Qt.Window | Qt.CustomizeWindowHint | Qt.WindowSystemMenuHint

    color: "transparent"


    FontLoader {
        id: appFont
        source: "qrc:/product-sans-regular.ttf"
    }

    font {
        family: appFont.name
    }

    background: Rectangle {
        color: "#121212"
        radius: 16
    }

    header: NavBar {
        id: navbar
        height: 40
        radius: mainWindow.background.radius
    }

    SideBar {
        id: sidebar
        width: 48
        height: parent.height

        radius: mainWindow.background.radius

        anchors {
            top: navbar.bottom
            topMargin: 4
            left: parent.left
        }
    }

    ViewsPopup {
        id: viewspop

        x: sidebar.x + sidebar.width + 4
        y: sidebar.y

        width: 307
        height: parent.height - y
    }
}
