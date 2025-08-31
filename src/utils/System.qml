pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import "helper.js" as Helper

Singleton {
    id: root
    property string cpuUsage: "0"
    property string memUsage: "0"

    property string prevStat
    property string currStat

    Process {
        id: procCpu
        command: ["cat", "/proc/stat"]
        running: true
        stdout: StdioCollector {
            id: cpuStdout
        }
    }

    Process {
        id: procMem
        command: ["cat", "/proc/meminfo"]
        running: true
        stdout: StdioCollector {
            id: memStdout
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            procCpu.running = true;
            procMem.running = true;

            // CPU Measure Routine
            root.prevStat = root.currStat;
            root.currStat = cpuStdout.text;
            root.cpuUsage = Helper.getCpuUsage(root.prevStat, root.currStat);

            // RAM Measure Routine
            root.memUsage = Helper.getMemUsage(memStdout.text);
        }
    }
}
