import QtQuick
import QtQuick.Controls.Basic
import QtQuickControls_Section8

SplitView {
    id: rootSplitView

    property color rectangleColor: "red"

    Item {
        SplitView.minimumWidth: widthSlider.width + 5

        Column {
            id: controlsColumn

            spacing: 10
            anchors.centerIn: parent

            ComboBox {
                id: colorSelect

                anchors.horizontalCenter: parent.horizontalCenter
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Use this ComboBox to change the color of the Rectangle")
                model: ListModel {
                    ListElement {key: "red"}
                    ListElement {key: "green"}
                    ListElement {key: "blue"}
                    ListElement {key: "more colors..."}
                }

                onActivated: {
                    if (colorSelect.currentIndex === 3){
                        colorPopup.open()
                    } else {
                        rectangleColor = colorSelect.currentText
                    }
                }
            }

            Dial {
                id: shadeDial

                anchors.horizontalCenter: parent.horizontalCenter
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Use this Dial to change the shade of the Rectangle")
                from: 0.6
                to: 2
                stepSize: 0.1
                value: 1
            }

            Slider {
                id: heightSlider

                anchors.horizontalCenter: parent.horizontalCenter
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Use this Slider to change the height of the Rectangle")
                from: 100
                to: 300
                stepSize: 1
                value: 200
            }

            Slider {
                id: widthSlider

                anchors.horizontalCenter: parent.horizontalCenter
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Use this Slider to change the width of the Rectangle")
                from: 100
                to: 300
                stepSize: 1
                value: 200
            }

            SpinBox {
                id: radiusInput

                anchors.horizontalCenter: parent.horizontalCenter
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Use this SpinBox to change the radius of the Rectangle")
                from: 0
                to: 50
                stepSize: 10
            }
        }
    }

    Item {
        SplitView.minimumWidth: customRect.width + 5

        Rectangle {
            id: customRect

            anchors.centerIn: parent
            height: heightSlider.value
            width: widthSlider.value
            radius: radiusInput.value
            color: Qt.darker(rootSplitView.rectangleColor, (shadeDial.value))
        }
    }

    Popup {
        id: colorPopup

        height: parent.height - 100
        width: parent.width - 200
        anchors.centerIn: parent

        ScrollView {
            anchors.fill: parent

            Column {
                id: scrollViewColumn

                width: parent.width

                Repeater {
                    model: ColorModel
                    delegate: Rectangle {
                        id: delegateRect

                        required property string valueText
                        required property int index

                        color: index % 2 ? "lightblue" : "lightgray"
                        height: 30
                        width: scrollViewColumn.width

                        Text {
                            anchors.centerIn: parent
                            text: valueText
                            font.pointSize: 15
                        }

                        MouseArea {
                            anchors.fill: parent
                            onPressed: {
                                delegateRect.color = Qt.darker(delegateRect.color, 1.3)
                            }

                            onReleased: {
                                delegateRect.color = delegateRect.index % 2 ? "lightblue" : "lightgray"
                                colorPopup.close()
                                rootSplitView.rectangleColor = valueText
                            }
                        }
                    }
                }
            }
        }
    }
}
