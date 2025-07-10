import QtQuick
import QtQuick.Layouts
import Quickshell
import "../util"

Scope {
    id: root
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

            // Background Color
            Rectangle {
                anchors.fill: parent
                color: Theme.base00
            }

            // Modules inside the Bar
            RowLayout {
                anchors.fill: parent
                uniformCellSizes: true

                Workspaces {
                    textColor: Theme.base05
                }
                Clock {
                    textColor: Theme.base05
                }
                Battery {
                    textColor: Theme.base05
                }
            }
        }
    }
}
