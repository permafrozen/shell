import QtQuick
import Quickshell
import Quickshell.Wayland
import QtQuick.Layouts

import qs.utils

Item {
    id: root
    property var shortcut: GlobalShortcuts.runnerShortcut

    PanelWindow {
        id: window
        visible: false
        color: "transparent"
        implicitWidth: 300
        implicitHeight: 300

        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
        WlrLayershell.namespace: "shell:launcher"

        Rectangle {
            anchors.fill: parent
            color: Theme.base00
            radius: 20

            ColumnLayout {
                anchors.fill: parent
                TextInput {
                    id: search
                    autoScroll: false
                    color: Theme.base05

                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    Keys.onEscapePressed: {
                        window.visible = false;
                    }
                }

                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: 20
                    model: ScriptModel {
                        values: DesktopEntries.applications.values.map(f => "hawk")
                    }
                    delegate: Text {
                        color: Theme.base05
                        required property var modelData
                        text: modelData
                    }
                }
            }
        }

        Connections {
            target: root.shortcut
            function onPressed() {
                window.visible = !window.visible;
                search.forceActiveFocus();
                search.clear();
            }
        }
    }
}
