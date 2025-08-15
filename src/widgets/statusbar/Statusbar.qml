import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.utils

Scope {
    id: root
    Background {}
    Variants {
        model: Quickshell.screens
        PanelWindow {
            color: "transparent"
            property var modelData
            screen: modelData
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
                BatteryIndicator {
                    textColor: Theme.base05
                }
            }
        }
    }
}
