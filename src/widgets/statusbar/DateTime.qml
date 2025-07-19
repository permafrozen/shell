import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    required property color textColor

    implicitHeight: clock.implicitHeight
    implicitWidth: clock.implicitWidth
    Layout.alignment: Qt.AlignCenter
    Text {
        id: clock

        color: root.textColor
        text: Qt.formatDateTime(systemTime.date, "hh:mm:ss dd-MM-yyyy")

        SystemClock {
            id: systemTime
            precision: SystemClock.Seconds
        }
    }
}
