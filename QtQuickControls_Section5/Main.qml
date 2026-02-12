// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Popups")

    Column {
        spacing: 15
        anchors.centerIn: parent

        Button {
            id: popupButton

            text: "Open Popup"
            width: root.width/3

            onClicked: {
                popup.open()
            }
        }

        Button {
            id: dialogButton

            text: "Open Dialog"
            width: root.width/3

            onClicked: {
                dialog.open()
            }
        }

        Button {
            id: drawerButton

            text: "Open Drawer"
            width: root.width/3

            onClicked: {
                drawer.open()
            }
        }

        Button {
            id: menuButton

            text: "Open Menu"
            width: root.width/3

            onClicked: {
                var xPos = parent.x + menuButton.pressX
                var yPos = parent.y + menuButton.y + menuButton.pressY
                menu.popup(xPos, yPos)
            }
        }

        Button {
            id: toolTip

            text: "Hover for one second for ToolTip"
            hoverEnabled: true
            width: root.width/3

            ToolTip.delay: 1000
            ToolTip.timeout: 5000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("This ToolTip is shown after hovering over the button for one second.")

            onClicked: {
                console.log("Clicked the ToolTop button")
            }
        }
    }

    Popup {
        id: popup

        height: 100
        width: 250
        anchors.centerIn: parent
        modal: true
        closePolicy: Popup.NoAutoClose

        enter: Transition {
                NumberAnimation { property: "scale"; from: 0.0; to: 1.0; duration: 100}
            }

        exit: Transition {
            NumberAnimation { property: "scale"; from: 1.0; to: 0.0; duration: 100 }
        }

        Row {
            anchors.centerIn: parent
            spacing: 20

            Button {
                height: 40
                width: 100
                text: "OK"

                onClicked: {
                    console.log("Popup Accepted")
                    popup.close()
                }
            }

            Button {
                height: 40
                width: 100
                text: "Cancel"

                onClicked: {
                    console.log("Popup Rejected")
                    popup.close()
                }
            }
        }
    }

    Dialog {
        id: dialog

        anchors.centerIn: parent
        height: 100
        width: 250
        standardButtons: Dialog.Ok | Dialog.Cancel
        title: "Dialog"

        onAccepted: {
            console.log("Dialog Accepted")
            dialog.close()
        }

        onRejected: {
            console.log("Dialog Rejected")
            dialog.close()
        }
    }

    Drawer {
        id: drawer

        width: root.width/2
        height: root.height
        edge: Qt.LeftEdge
        interactive: true

        Column {
            anchors.centerIn: parent
            spacing: 20

            Button {
                height: 40
                width: 100
                text: "OK"

                onClicked: {
                    console.log("Drawer Accepted")
                    drawer.close()
                }
            }

            Button {
                height: 40
                width: 100
                text: "Cancel"

                onClicked: {
                    console.log("Drawer Rejected")
                    drawer.close()
                }
            }
        }
    }

    Menu {
        id: menu

        MenuItem {
            text: "OK"
            onClicked: console.log("Menu Accepted")
        }

        MenuItem {
            text: "Cancel"
            onClicked: console.log("Menu Rejected")
        }
    }
}

