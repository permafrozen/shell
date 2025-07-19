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
            let batteryPercentage = "";

            [...UPower.devices.values].forEach(device => {
                if (device != null && device.isLaptopBattery) {
                    batteryPercentage = device.percentage * 100;
                }
            });

            return batteryPercentage;
        }

        text: getBatteryPercentage() + "%"
        color: root.textColor
    }
}
