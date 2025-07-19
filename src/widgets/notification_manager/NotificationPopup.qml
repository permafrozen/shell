pragma ComponentBehavior: Bound
import Quickshell
import QtQuick
import qs.utils

PanelWindow {
    id: root
    visible: false
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    anchors {
        left: true
        right: true
        bottom: true
        top: true
    }

    //create a clickable mask for a certain region, only that region is clickable than
    mask: Region {
        item: notificationsView
    }

    Component.onCompleted: {
        NotificationServer.server.onNotification.connect(notif => {
            // Ignore Tracked Notifications from last Session
            if (notif.lastGeneration) {
                return "";
            }

            notificationsModel.append({
                "name": notif.appName,
                "body": notif.body,
                "gen": notif.lastGeneration
            });
        });
    }

    ListModel {
        id: notificationsModel

        // Notification Added
        onRowsInserted: {
            console.log("ROWS INSERT");
            root.visible = notificationsModel.count >= 0 ? true : false;
            notificationsView.implicitHeight += 20 + 30; // Text height + Spacing in Between
        }

        // Notification Removed
        onRowsRemoved: {
            console.log("ROW REMOVED");
            notificationsView.implicitHeight -= (20 + 30); // text size + spacing
        }
    }

    ListView {
        id: notificationsView
        x: root.width / 2 - width / 2
        y: 30 + 20 // bar height + custom margin
        model: notificationsModel
        implicitHeight: 0
        implicitWidth: 400 // just hardcoded
        spacing: 30
        verticalLayoutDirection: ListView.TopToBottom
        ListView.delayRemove: true

        delegate: Rectangle {
            id: notification

            required property string name
            required property string body
            required property bool gen
            required property int index

            radius: 5
            color: Theme.base00
            implicitWidth: notificationsView.implicitWidth
            implicitHeight: text.implicitHeight + 10

            Text {
                id: text
                anchors.centerIn: parent
                color: Theme.base05
                text: `[${notification.name}]: ${notification.body}`
            }

            Timer {
                running: true
                interval: 5000
                onTriggered: {
                    notificationsModel.remove(notification.index);
                }
            }
        }

        populate: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1.0
                duration: 400
            }
        }

        add: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1.0
                duration: 400
            }
        }

        move: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 1000
            }
        }

        remove: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1.0
                to: 0
                duration: 400
            }
        }

        displaced: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 400
                easing.type: Easing.OutBounce
            }
        }
    }
}
