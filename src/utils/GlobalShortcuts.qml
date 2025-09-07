pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
    id: root
    readonly property GlobalShortcut runnerShortcut: runner

    GlobalShortcut {
        id: runner
        appid: "shell"
        name: "runner"
        description: "Launches the application runner."
    }
}
