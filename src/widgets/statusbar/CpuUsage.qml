import QtQuick
import qs.utils

Item {
    id: root
    required property color textColor
    implicitWidth: cpuUsageText.implicitWidth
    implicitHeight: cpuUsageText.implicitHeight

    // TODO: CHANGE GENERAL BAR LAYOUT
    Text {
        id: cpuUsageText
        color: root.textColor
        text: `CPU: ${System.cpuUsage}%`
    }
}
