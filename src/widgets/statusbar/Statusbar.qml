import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.utils

Item {
    id: root
    required property ShellScreen screen

    Background {}
    PanelWindow {
        color: "transparent"
        screen: root.screen
        implicitHeight: 30

        anchors {
            left: true
            top: true
            right: true
        }

        // Modules inside the Bar
        RowLayout {
            anchors.fill: parent
            uniformCellSizes: true

            Workspaces {
                textColor: Theme.base05
            }

            DateTime {
                textColor: Theme.base05
            }

            RowLayout {
                Layout.alignment: Qt.AlignRight
                spacing: 25
                MemUsage {
                    textColor: Theme.base05
                }
                CpuUsage {
                    textColor: Theme.base05
                }
                BatteryIndicator {
                    textColor: Theme.base05
                }
            }
        }
    }
}
