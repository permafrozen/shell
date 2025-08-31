import Quickshell
import QtQuick
import qs.utils

Item {
    id: root
    required property color textColor
    implicitWidth: memText.implicitWidth
    implicitHeight: memText.implicitHeight

    Text {
        id: memText
        color: root.textColor
        text: `MEM: ${System.memUsage}%`
    }
}
