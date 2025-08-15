import QtQuick
import QtQuick.Shapes
import Quickshell
import qs.utils

Variants {
    model: Quickshell.screens
    PanelWindow {
        property var modelData
        screen: modelData
        color: "transparent"
        exclusionMode: ExclusionMode.Ignore
        aboveWindows: false
        implicitHeight: 100

        anchors {
            top: true
            left: true
            right: true
        }

        // Background Color
        Rectangle {
            id: background
            anchors.top: parent.top
            color: Theme.base00
            implicitWidth: parent.width
            implicitHeight: 30
        }

        // Left Corner
        Shape {
            id: leftCorner
            y: 30
            width: 20
            height: 20
            ShapePath {
                strokeWidth: 0
                strokeColor: Theme.base00
                fillColor: Theme.base00
                startX: 0
                startY: 0

                PathAngleArc {
                    centerX: 20
                    centerY: 20
                    radiusX: 20
                    radiusY: 20
                    startAngle: 180
                    sweepAngle: 90
                }

                PathLine {}
            }
        }

        // Right Corner

        Shape {
            id: rightCorner
            x: background.width - this.width
            y: 30
            width: 20
            height: 20
            ShapePath {
                strokeWidth: 0
                strokeColor: Theme.base00
                fillColor: Theme.base00
                startX: 0
                startY: 0

                PathAngleArc {
                    centerX: 0
                    centerY: 20
                    radiusX: 20
                    radiusY: 20
                    startAngle: 260
                    sweepAngle: 90
                }

                PathLine {
                    x: 20
                    y: 0
                }
            }
        }
    }
}
