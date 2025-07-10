import Quickshell
import QtQuick

Scope {
    PanelWindow {
        id: panel
        visible: false
        anchors {
            left: true
            right: true
            top: true
        }

        Component.onCompleted: {
            NotificationServer.server.onNotification.connect(notif => {
                console.log(notif.body);
                notifyBody.text = notif.body;
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
            text: "No Notification Yet"
        }
    }
}
