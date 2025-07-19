import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    required property color textColor

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    Layout.fillWidth: false
    Layout.alignment: Qt.AlignLeft

    RowLayout {
        id: layout
        anchors.fill: parent

        Repeater {
            model: Hyprland.workspaces
            Text {
                id: workspaceText
                function getWorkspace(workspace) {
                    if (workspace == null) {
                        return "";
                    }

                    if (workspace.focused === true) {
                        swipeDown.running = true;
                        swipeUp.running = true;
                        return `[${workspace.id}]`;
                    } else {
                        return ` ${workspace.id} `;
                    }
                }

                property list<HyprlandWorkspace> ws_list: Hyprland.workspaces.values
                required property int index
                text: getWorkspace(ws_list[index])
                y: 5

                leftPadding: 10
                rightPadding: 10
                color: root.textColor

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
}
