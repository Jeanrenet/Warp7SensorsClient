import QtQuick 2.9
import QtSensors 5.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Item {
    Rectangle {
        id: playground
        anchors.fill: parent

        DropShadow {
            anchors.fill: ball
            radius: 8
            samples: 1
            horizontalOffset: -Main.acc_x * 2
            verticalOffset: Main.acc_y*2
            color: Main.acc_y <0 ? "#80FF0000": "#800000FF"
            source: ball
            rotation : 180
            scale: Main.acc_z >= 0 ? (Main.acc_z/ 10) + 1: 1 - (Main.acc_z/ 10)
            Behavior on scale {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
            Behavior on horizontalOffset {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
            Behavior on verticalOffset {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
        }

        Image {
            id: ball
            width: 100
            fillMode: Image.PreserveAspectFit
            antialiasing: true
            smooth: true
            clip: true
            visible: false
            source: "qrc:/Images/plane.png"

            x: -(Main.acc_x / 10) * parent.width/3 + (parent.width - ball.width) / 2
            y: (Main.acc_y / 10 ) * parent.height/3 + (parent.height - ball.height) / 2

            Behavior on y {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
            Behavior on x {
                NumberAnimation {
                    alwaysRunToEnd: false
                }
            }
        }
    }
}
