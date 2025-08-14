pragma ComponentBehavior: Bound
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    required property color textColor
    implicitHeight: parent.implicitHeight
    Layout.fillWidth: false
    Layout.alignment: Qt.AlignLeft

    Text {
        id: focusedWorkspaceIndicator
        text: "[ ]"
        color: root.textColor

        Behavior on x {
            SmoothedAnimation {
                velocity: 200
                duration: 200
            }
        }
    }

    Repeater {
        model: Hyprland.workspaces

        Text {
            id: workspaceText
            required property int index
            property list<HyprlandWorkspace> ws_list: Hyprland.workspaces.values
            property int box_padding: 10
            property int box_index: index * 50

            visible: false
            text: getWorkspace(ws_list[index])
            leftPadding: box_padding
            rightPadding: box_padding
            color: root.textColor
            x: box_index

            function getWorkspace(workspace) {
                if (workspace == null) {
                    return "";
                }

                if (workspace.focused === true) {
                    focusedWorkspaceIndicator.x = box_index + box_padding;
                }

                return ` ${workspace.id} `;
            }

            // wait a little bit to avoid visual glitch when workspace are created, after the ones before are being removed
            Timer {
                interval: 100
                running: true
                onTriggered: workspaceText.visible = true
            }

            Behavior on x {
                SmoothedAnimation {
                    velocity: 200
                    duration: 200
                }
            }

            OpacityAnimator {
                target: workspaceText
                from: 0
                to: 1
                duration: 350
                running: true
                easing.type: Easing.InQuad
            }

            NumberAnimation {
                id: swipeUp
                target: workspaceText
                from: 2
                to: 0
                properties: "y"
                duration: 200
                easing.type: Easing.InQuad
                running: true
            }

            NumberAnimation {
                id: swipeDown
                target: workspaceText
                from: 0
                to: 2
                properties: "y"
                duration: 200
                easing.type: Easing.InQuad
                running: true
            }
        }
    }
}
