pragma Singleton
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var notifications: notificationServer.trackedNotifications.values
    property NotificationServer server: notificationServer

    NotificationServer {
        id: notificationServer

        actionIconsSupported: true
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        bodySupported: true
        imageSupported: true
        keepOnReload: true
        persistenceSupported: true

        onNotification: notification => {
            notification.tracked = true;
        }
    }
}
