import QtQuick 2.9
import QtSensors 5.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item {
    property real outerRadius : 0

    CircularGauge {
        style: CircularGaugeStyle {
            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.9
                antialiasing: true
                color: Qt.rgba(0.66, 0.3, 0, 1)
            }
        }
    }
}
