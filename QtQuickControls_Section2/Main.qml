import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Buttons")

    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            id: button

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Button"
            height: 50
            width: 100

            onClicked: { console.log("Button clicked") }
        }

        DelayButton {
            id: delayButton

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Delay Button"
            delay: 2000

            onActivated: { console.log("DelayButton activated") }
        }

        Switch {
            id: switchControl

            anchors.horizontalCenter: parent.horizontalCenter
            text: "Switch"

            onCheckedChanged: { console.log("Switch state changed to: " + checked) }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Check Boxes"
            }

            Row {
                CheckBox {
                    id: checkBox1

                    onCheckStateChanged: { console.log("CheckBox 1 state changed to: " + checkState) }
                }

                CheckBox {
                    id: checkBox2

                    onCheckStateChanged: { console.log("CheckBox 2 state changed to: " + checkState) }
                }

                CheckBox {
                    id: checkBox3
                    tristate: true

                    onCheckStateChanged: { console.log("CheckBox 3 state changed to: " + checkState) }
                }
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Radio Buttons"
            }

            Row {
                RadioButton {
                    id: radioButton1

                    onCheckedChanged: { console.log("RadioButton 1 state changed to: " + checked) }
                }

                RadioButton {
                    id: radioButton2

                    onCheckedChanged: { console.log("RadioButton 2 state changed to: " + checked) }
                }

                RadioButton {
                    id: radioButton3

                    onCheckedChanged: { console.log("RadioButton 3 state changed to: " + checked) }
                }
            }
        }
    }
}
