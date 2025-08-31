import QtQuick
import Quickshell
import Quickshell.Wayland

Item {
    id: root
    required property ShellScreen screen
    PanelWindow {
        screen: root.screen
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Background
        WlrLayershell.namespace: "shell:background"

        anchors {
            left: true
            bottom: true
            right: true
            top: true
        }

        Image {
            id: image
            source: Qt.resolvedUrl("alps.png")
            anchors.fill: parent
        }
    }
}
