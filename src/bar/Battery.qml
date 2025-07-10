import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

Item {
    id: root
    required property color textColor
    implicitWidth: battery.implicitWidth
    implicitHeight: battery.implicitHeight
    Layout.alignment: Qt.AlignRight

    Text {
        id: battery
        property var devices: UPower.devices.values
        property int lenght: UPower.devices.values.length

        function getBatteryPercentage() {
            for (var i = 0; i <= lenght - 1; i++) {
                if (devices[i] != null && devices[i].isLaptopBattery) {
                    return Math.ceil(devices[i].percentage * 100);
                }
            }
        }

        text: getBatteryPercentage() + "%"
        color: root.textColor
    }
}
