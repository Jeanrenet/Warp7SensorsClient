import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 320
    height: 640
    title: qsTr("Read From Cortex-M4")

    SwipeView {
        id: swipeView
        currentIndex: 1
        anchors.fill: parent
        AccelerometerPage {

        }
        BarometerPage {

        }
        MagnetometerPage {

        }
        GyroscopePage {

        }
    }
    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
