import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../util" as Util

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            color: Util.Theme.base00

            screen: modelData
            anchors {
                left: true
                top: true
                right: true
            }
            implicitHeight: 25

            Text {
                color: Util.Theme.base05
                text: Qt.formatDateTime(clock.date, "hh:mm:ss dd-MM-yyyy")
                anchors.centerIn: parent

                SystemClock {
                    id: clock
                    precision: SystemClock.Seconds
                }
            }
            Row {
                Repeater {
                    model: Hyprland.workspaces
                    Text {
                        function getWorkspace(workspaceLabel, isFocused) {
                            var workspaceString = "";
                            if (isFocused) {
                                workspaceString = `[${workspaceLabel}]`;
                            } else
                                workspaceString = `-${workspaceLabel}-`;
                            return workspaceString;
                        }

                        property list<HyprlandWorkspace> ws_list: Hyprland.workspaces.values
                        required property int index
                        text: getWorkspace(ws_list[index].id, ws_list[index].focused)

                        leftPadding: 10
                        rightPadding: 10
                        color: Util.Theme.base05
                    }
                }
            }
        }
    }
}
