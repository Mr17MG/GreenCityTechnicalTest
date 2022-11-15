import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Button {

    flat: true
    spacing: 10

    topInset: 0
    bottomInset: 0

    topPadding: 4
    rightPadding: 16
    bottomPadding: 4
    leftPadding: 8

    Material.foreground:"#FFFFFF"
    opacity: highlighted ? 1
                         : 0.4
    Material.background: highlighted?"#323131":"transparent"
    Material.accent: "#FFFFFF"
    font {
        pixelSize: 15
        capitalization: Font.MixedCase
    }

    icon {
        width: 20
        height: 20
    }
}
