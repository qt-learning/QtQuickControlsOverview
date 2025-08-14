import QtQuick
import QtQuick.Controls.Basic

Page {
    id: rootItem

    property bool feedbackVisible: true
    required property MenuBar menuBar

    header: Item {
        id: headerItem

        visible: feedbackVisible

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Let us know what you think"
            font.pointSize: 15
        }
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: timer.running

        onRunningChanged: {
            if (running) {
                rootItem.menuBar.enabled = false
            } else {
                rootItem.menuBar.enabled = true
            }
        }
    }

    Column {
        id: submitMessageColumn

        anchors.centerIn: parent
        visible: false

        Text {
            text: "Feedback submitted!"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 35
        }

        Text {
            text: "You may leave this page"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
        }
    }

    Timer {
        id: timer

        interval: 3000
        repeat: false
        running: false
        onTriggered: submitMessageColumn.visible = true
    }

    Column {
        anchors.centerIn: parent
        visible: rootItem.feedbackVisible
        spacing: 10

        GroupBox {
            anchors.horizontalCenter: parent.horizontalCenter

            ButtonGroup {
                Component.onCompleted: {
                    addButton(awfulButton)
                    addButton(badButton)
                    addButton(okayButton)
                    addButton(goodButton)
                    addButton(greatButton)
                }
            }

            Row {
                Column {
                    RadioButton {
                        id: awfulButton

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Awful"
                    }
                }

                Column {
                    RadioButton {
                        id: badButton

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Bad"
                    }
                }

                Column {
                    RadioButton {
                        id: okayButton

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Okay"
                    }
                }

                Column {
                    RadioButton {
                        id: goodButton

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Good"
                    }
                }

                Column {
                    RadioButton {
                        id: greatButton

                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Great"
                    }
                }
            }
        }

        Frame {
            id: feedbackFrame

            anchors.horizontalCenter: parent.horizontalCenter
            width: rootItem.width - 200
            height: rootItem.height - 300

            TextArea {
                anchors.fill: parent
                placeholderText: "Additional comments..."
            }
        }

        Row {
            id: buttonRow

            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            DelayButton {
                width: feedbackFrame.width
                height: 50
                delay: 500
                text: "Submit Feedback"
                onActivated: {
                    timer.running = true
                    rootItem.feedbackVisible = false
                }
            }
        }
    }
}

