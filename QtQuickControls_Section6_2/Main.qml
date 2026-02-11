// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Panes")

    property bool pageOpen: false
    property bool scrollViewOpen: false
    property bool frameOpen: false

    footer: ToolBar {
        id: toolBar

        Row {
            height: 50
            width: root.width

            ToolButton {
                text: "Push Page"
                width: parent.width/4
                height: parent.height
                enabled: !pageOpen

                onClicked: { stackView.push(pageComponent) }
            }

            ToolButton {
                text: "Push Frame"
                width: parent.width/4
                height: parent.height
                enabled: !frameOpen

                onClicked: { stackView.push(frameComponent) }
            }

            ToolButton {
                text: "Push ScrollView"
                width: parent.width/4
                height: parent.height
                enabled: !scrollViewOpen

                onClicked: { stackView.push(scrollViewComponent) }
            }

            ToolSeparator {
                orientation: Qt.Vertical
            }

            ToolButton {
                text: "Pop"
                width: parent.width/4
                height: parent.height
                enabled: pageOpen || scrollViewOpen || frameOpen

                onClicked: { stackView.pop() } 
            }
        }
    }

    StackView {
        id: stackView

        anchors.fill: parent
        initialItem: paneComponent
    }

    Component {
        id: paneComponent

        Pane {
            id: pane

            Text {
                anchors.centerIn: parent
                text: "Pane"
                font.pointSize: 20
            }
        }
    }

    Component {
        id: pageComponent

        Page {
            id: page

            header: Rectangle {
                width: root.width
                height: 30
                color: "lightgray"

                Text {
                    anchors.centerIn: parent
                    font.pointSize: 18
                    text: "Header"
                }
            }

            footer: Rectangle {
                width: root.width
                height: 30
                color: "lightgray"

                Text {
                    anchors.centerIn: parent
                    font.pointSize: 18
                    text: "Footer"
                }
            }

            Text {
                anchors.centerIn: parent
                text: "Page"
                font.pointSize: 20
            }

            Component.onCompleted: pageOpen = true
            Component.onDestruction: pageOpen = false
        }
    }

    Component {
        id: frameComponent

        Frame {
            Row {
                anchors.centerIn: parent
                spacing: 10

                Frame {
                    height: 150
                    width: 150

                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 20
                        text: "Frame"
                    }
                }
            }

            Component.onCompleted: frameOpen = true
            Component.onDestruction: frameOpen = false
        }
    }

    Component {
        id: scrollViewComponent

        ScrollView {
            id: scrollView

            Column{
                anchors.centerIn: parent

                Repeater {
                    model: 100
                    delegate: Text {
                        text: "ScrollView item: " + index
                        font.pointSize: 20
                    }
                }
            }

            Component.onCompleted: scrollViewOpen = true
            Component.onDestruction: scrollViewOpen = false
        }
    }
}
