pragma Singleton
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var notifications: notificationServer.trackedNotifications.values
    property NotificationServer server: notificationServer

    NotificationServer {
        id: notificationServer
        onNotification: notification => {
            notification.tracked = true;
        }
    }
}
