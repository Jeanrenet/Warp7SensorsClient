import QtQuick 2.9
import QtSensors 5.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    id:item

    property real angle : ((Math.atan2(Main.mag_x * 1000000, Main.mag_y * 1000000) / Math.PI) * 180)

    ColumnLayout {
        anchors.fill: parent
        Image {
            id: image
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 1.5
            antialiasing: true
            fillMode: Image.PreserveAspectFit
            clip: true
            source: "qrc:/Images/compass.png"
            smooth: true
            rotation : angle

            Behavior on rotation {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
        }
        ColumnLayout {
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                text: "Read X :" + Main.mag_x * 1000000;
                font.family: "Courier"
                font.pixelSize: 18
            }
            Text {
                text: "Read Y :" + Main.mag_y * 1000000;
                font.family: "Courier"
                font.pixelSize: 18
            }
            Text {
                text: "Read Z :" + Main.mag_z * 1000000;
                font.family: "Courier"
                font.pixelSize: 18
            }
        }
    }
}
