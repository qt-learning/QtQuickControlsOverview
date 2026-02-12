// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Indicators")

    Column {
        anchors.centerIn: parent
        spacing: 25

        Column {
            spacing: 3
            anchors.horizontalCenter: parent.horizontalCenter

            BusyIndicator {
                id: busyIndicator

                anchors.horizontalCenter: parent.horizontalCenter
                running: true
            }

            Text {
                text: "BusyIndicator"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3

            PageIndicator {
                id: pageIndicator

                anchors.horizontalCenter: parent.horizontalCenter
                count: 10
                interactive: true
            }

            Text {
                text: "PageIndicator"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3

            ProgressBar {
                id: progressBar

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 100
                value: 0
            }

            Text {
                text: "ProgressBar"
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
            }
        }

        Timer {
            id: timer

            interval: 50
            repeat: true
            running: true
            onTriggered: {
                if (progressBar.value < 100) {
                    progressBar.value += 1
                } else {
                    progressBar.value = 0
                }
            }
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10

            Column {
                spacing: 15

                Text {
                    text: "ScrollIndicator"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }

                ListView {
                    height: 100
                    width: 110
                    anchors.horizontalCenter: parent.horizontalCenter
                    model: model

                    ScrollIndicator.vertical: ScrollIndicator {}

                    delegate: Text {
                        text: "Item number " + index
                    }
                }
            }

            Column {
                spacing: 15

                Text {
                    text: "ScrollBar"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pointSize: 12
                }

                ListView {
                    height: 100
                    width: 110
                    anchors.horizontalCenter: parent.horizontalCenter
                    model: model

                    ScrollBar.vertical: ScrollBar {}

                    delegate: Text {
                        text: "Item number " + index
                    }
                }
            }
        }
    }

    ListModel {
        id: model

        ListElement { number: 1 }
        ListElement { number: 2 }
        ListElement { number: 3 }
        ListElement { number: 4 }
        ListElement { number: 5 }
        ListElement { number: 6 }
        ListElement { number: 7 }
        ListElement { number: 8 }
        ListElement { number: 9 }
        ListElement { number: 10 }
        ListElement { number: 11 }
        ListElement { number: 12 }
        ListElement { number: 13 }
        ListElement { number: 14 }
        ListElement { number: 15 }
    }
}
