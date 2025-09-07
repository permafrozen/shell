//@ pragma ShellId shell

import Quickshell
import QtQuick

// Top Level Widgets
import qs.widgets.statusbar
import qs.widgets.notification_manager
import qs.widgets.background
import qs.widgets.runner

ShellRoot {
    Runner {}

    Variants {
        model: Quickshell.screens

        Scope {
            id: scope
            property var modelData

            Statusbar {
                screen: scope.modelData
            }

            NotificationPopup {}

            Background {
                screen: scope.modelData
            }
        }
    }
}
