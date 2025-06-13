import Quickshell
import Quickshell.Io
import QtQuick // for Text

Scope {
    id: root
    property string time

    Variants {
        model: Quickshell.screens
        PanelWindow {
            property var modelData

            screen: modelData
            anchors {
                top: true
                left: true
                bottom: true
            }

            implicitHeight: 30

            Text {
                anchors.centerIn: parent
                text: Time.time
            }
        }
    }
}
