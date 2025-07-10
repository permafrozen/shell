import Quickshell
import QtQuick
import "../util"

Scope {
    PanelWindow {
        id: panel
        visible: false
        color: Theme.base00
        implicitHeight: notifyBody.implicitHeight
        anchors {
            left: true
            right: true
            top: true
        }

        Component.onCompleted: {
            NotificationServer.server.onNotification.connect(notif => {
                console.log(notif.body);
                notifyBody.text = `[${notif.appName}]: ${notif.body}`;
                panel.visible = true;
            });
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                panel.visible = false;
            }
        }

        Text {
            id: notifyBody
            anchors.fill: parent
            color: Theme.base05
        }
    }
}
