// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

Window {
    width: 640
    height: 900
    visible: true
    title: qsTr("Input Controls")

    Column {
        anchors.centerIn: parent
        spacing: 10

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Slider {
                id: slider

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 10
                stepSize: 1
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Slider Value: " + slider.value
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            RangeSlider {
                id: rangeSlider

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 10
                stepSize: 1
                snapMode: Slider.SnapAlways
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Left Value: " + parseInt(rangeSlider.first.value) + " | Right Value: " + parseInt(rangeSlider.second.value)
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Dial {
                id: dial

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 100
                stepSize: 1
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Dial Value: " + dial.value
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3

            SpinBox {
                id: spinBox

                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 10
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "SpinBox Value: " + spinBox.value
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3

            ComboBox {
                id: comboBox

                anchors.horizontalCenter: parent.horizontalCenter
                width: 150
                valueRole: "value"
                textRole: "key"

                model: ListModel {
                    ListElement { key: "First"; value: 123 }
                    ListElement { key: "Second"; value: 456 }
                    ListElement { key: "Third"; value: 789 }
                }

                delegate: ItemDelegate {
                    height: 50
                    width: comboBox.width
                    required property string key
                    required property int value
                    required property int index

                    Text {
                        id: delegateText

                        anchors.centerIn: parent
                        text: key + ": " + value
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "ComboBox Text: " + comboBox.currentText + " | ComboBox Value: " + comboBox.currentValue
            }
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter

            Tumbler {
                id: tumbler

                anchors.horizontalCenter: parent.horizontalCenter
                height: 100

                model: ListModel {
                    ListElement { key: "First"}
                    ListElement { key: "Second"}
                    ListElement { key: "Third"}
                    ListElement { key: "Forth"}
                    ListElement { key: "Fifth"}
                    ListElement { key: "Sixth"}
                }

                delegate: Rectangle {
                    required property string key
                    required property int index

                    color: "lightgray"
                    opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)

                    Text {
                        anchors.centerIn: parent
                        text: key
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Tumbler Text: " + tumbler.currentItem.key
            }
        }

        TextField {
            id: textField

            width: 200
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "This is a TextField"
        }

        TextArea {
            id: textArea

            height: 200
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "This is a TextArea"
        }
    }
}
