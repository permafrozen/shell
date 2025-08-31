pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import "helper.js" as Helper

Singleton {
    id: root
    property string cpuUsage
    property string prevStat
    property string currStat

    Process {
        id: procStat
        command: ["cat", "/proc/stat"]
        running: true
        stdout: StdioCollector {
            id: stdout
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            procStat.running = true; 
            root.prevStat = root.currStat;
            root.currStat = stdout.text;
            root.cpuUsage = Helper.getCpuUsage(root.prevStat, root.currStat);
        }
    }
}
