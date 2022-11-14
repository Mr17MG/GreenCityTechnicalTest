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
    Material.primary: "#13EC91"
    Material.accent: "#13EC91"


   header: NavBar {
        id: navbar
        height: 40
    }

    SideBar {
        id: sidebar
        width: 48
        height: parent.height

        anchors {
            top: navbar.bottom
            topMargin: 2
            left: parent.left
        }
    }

    ViewsPopup {
        id: viewspop

        x:sidebar.x + sidebar.width + 2
        y: sidebar.y
        width: 300
        height: parent.height
    }
}
