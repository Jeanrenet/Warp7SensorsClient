import QtQuick 2.9
import QtSensors 5.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtCharts 2.2

Item {
    Rectangle {
        id: playground
        anchors.fill: parent

        ChartView {
            id: chartView
            antialiasing: true
            anchors.fill: parent

            Connections {
                target : Main
                onDataChanged: {
                    Main.updateBarometerGraphe(chartView.series(0)) // update splineseries
                }
            }

            SplineSeries {
                id:  splineSerie
                useOpenGL: true
                name: "Atmospheric Pressure"
                axisX: ValueAxis {
                    id: axisXLegend
                    min: 0
                    max: Main.maxHistory()
                    titleText: "History"
                    labelsFont:Qt.font({pointSize: 8})
                }
                axisY: ValueAxis {
                    id: axisYLegend
                    min: 975
                    max: 1050
                    titleText: "Pressure (Hectopascal)"
                    labelsFont:Qt.font({pointSize: 8})
                }
            }
        }
    }
}
