// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

ApplicationWindow {
    id: mainWindow

    width: 640
    height: 480
    visible: true
    title: qsTr("Qt Quick Controls")
    Component.onCompleted: getNameDialog.open()

    property int lastSelectedView: 3

    menuBar: MenuBar {
        Menu {
            title: "Menu"
            enabled: !getNameDialog.opened

            MenuItem {
                text: "Input Controls"
                enabled: !(lastSelectedView === 0)

                onTriggered: {
                    mainStackView.pop()
                    mainStackView.push("QML/InputControls.qml")
                    mainWindow.lastSelectedView = 0
                }
            }

            MenuItem {
                text: "Feedback"
                enabled: !(lastSelectedView === 1)

                onTriggered: {
                    mainStackView.pop()
                    mainStackView.push("QML/Feedback.qml", { menuBar: mainWindow.menuBar })
                    mainWindow.lastSelectedView = 1
                }
            }

            MenuItem {
                text: "Qt Logos"
                enabled: !(lastSelectedView === 2)

                onTriggered: {
                    mainStackView.pop()
                    mainStackView.push("QML/LogosSwipeView.qml")
                    mainWindow.lastSelectedView = 2
                }
            }

            MenuSeparator {}

            MenuItem {
                text: "Re-Enter Name"

                onTriggered: {
                    getNameDialog.open()
                }
            }

            MenuItem {
                text: "Title View"
                enabled: !(lastSelectedView === 3)

                onTriggered: {
                    mainStackView.pop()
                    mainWindow.lastSelectedView = 3
                }
            }
        }
    }

    StackView {
        id: mainStackView

        anchors.fill: parent
        initialItem: initialTextComponent

        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 50
            }
        }
    }

    Component {
        id: initialTextComponent

        Item {
            Column {
                anchors.centerIn: parent

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: !getNameDialog.opened
                    text: "Hello " + popupTextField.text
                    font.pointSize: 20
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: !getNameDialog.opened
                    text: "Welcome to Qt Quick Controls!"
                    font.pointSize: 20
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: !getNameDialog.opened
                    text: "(Use the MenuBar in the top left for options)"
                    font.pointSize: 12
                }
            }
        }
    }

    Dialog {
        id: getNameDialog

        anchors.centerIn: parent
        title: "What is your name?"
        height: mainWindow.height / 3
        width: mainWindow.width / 3
        modal: true
        closePolicy: Popup.NoAutoClose

        exit: Transition {
            NumberAnimation { property: "scale"; from: 1.0; to: 0.0; duration: 100 }
        }

        Column {
            anchors.centerIn: parent
            spacing: 10

            TextField {
                id: popupTextField

                width: getNameDialog.width - 10
                placeholderText: "Enter Name"
            }

            Button {
                width: getNameDialog.width - 10
                text: "Confirm"
                onClicked: getNameDialog.close()
            }
        }
    }
}
