import QtQuick
import qs.utils

Item {
    id: root
    required property color textColor
    implicitWidth: resources.implicitWidth
    implicitHeight: resources.implicitHeight

    // TODO: CHANGE GENERAL BAR LAYOUT
    Text {
        id: resources
        color: root.textColor
        text: `CPU: ${System.cpuUsage}%`
    }
}
