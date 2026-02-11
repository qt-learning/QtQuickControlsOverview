// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: window

    width: 640
    height: 480
    visible: true
    title: qsTr("Containers")

    menuBar: MenuBar {
        Menu {
            title: "Menu"
            MenuItem {
                text: "Menu Item 1"
                onTriggered: console.log("Clicked menu item 1")
            }

            MenuSeparator {}

            MenuItem {
                text: "Menu Item 2"
                onTriggered: console.log("Clicked menu item 2")
            }

            MenuItem {
                text: "Menu Item 3"
                onTriggered: console.log("Clicked menu item 3")
            }
        }
    }

    header: Rectangle {
        height: 10
        width: window.width
        color: "gray"
    }

    SwipeView {
        id: swipeView

        anchors.fill: parent
        orientation: Qt.Horizontal

        Item {
            id: item1

            Text {
                anchors.centerIn: parent
                font.pointSize: 25
                text: "SwipeView Item 1"
            }
        }

        Item {
            id: item2

            Text {
                anchors.centerIn: parent
                font.pointSize: 25
                text: "SwipeView Item 2"
            }
        }

        SplitView {
            Rectangle {
                color: "red"
                implicitWidth: window.width/2

                Text {
                    anchors.centerIn: parent
                    text: "SplitView Side 1"
                    color: "white"
                    font.pointSize: 20
                }
            }

            Rectangle {
                color: "blue"
                implicitWidth: window.width/2

                Text {
                    anchors.centerIn: parent
                    text: "SplitView Side 2"
                    color: "white"
                    font.pointSize: 20
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar

        currentIndex: swipeView.currentIndex

        TabButton {
            text: "Tab 1"
            onClicked: { swipeView.currentIndex = 0}
        }

        TabButton {
            text: "Tab 2"
            onClicked: { swipeView.currentIndex = 1}
        }

        TabButton {
            text: "Tab 3"
            onClicked: { swipeView.currentIndex = 2}
        }
    }
}




