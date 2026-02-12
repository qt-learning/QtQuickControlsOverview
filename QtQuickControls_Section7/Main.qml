// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls.Basic

Window {
    id: root

    width: 640
    height: 480
    visible: true
    title: qsTr("Customizing Controls")

    property color baseBackgroundColor: "pink"
    property color baseContentItemColor: "lightblue"

    Row {
        anchors.centerIn: parent
        spacing: 20

        Button {
            id: customButton

            height: 100
            width: 200
            hoverEnabled: true

            topPadding: customButton.height/4
            bottomPadding: customButton.height/4
            leftPadding: customButton.width/4
            rightPadding: customButton.width/4

            contentItem: Rectangle {
                id: contentItemRectangle

                color: root.baseContentItemColor
                border.color: "black"

                Text {
                    anchors.centerIn: parent
                    text: "Content Item"
                }
            }

            background: Rectangle {
                id: backgroundRectangle

                color: root.baseBackgroundColor
                border.color: "black"
                radius: width/20

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Background"
                }
            }

            onClicked: console.log("Custom button clicked")

            onPressed: {
                backgroundRectangle.color = Qt.darker(baseBackgroundColor, 1.3)
                contentItemRectangle.color = Qt.darker(baseContentItemColor, 1.3)
            }

            onReleased: {
                backgroundRectangle.color = Qt.darker(baseBackgroundColor, 1.1)
                contentItemRectangle.color = Qt.darker(baseContentItemColor, 1.1)
            }

            onHoveredChanged: {
                if (hovered === true) {
                    backgroundRectangle.color = Qt.darker(baseBackgroundColor, 1.1)
                    contentItemRectangle.color = Qt.darker(baseContentItemColor, 1.1)
                } else {
                    backgroundRectangle.color = baseBackgroundColor
                    contentItemRectangle.color = baseContentItemColor
                }
            }
        }

        Button {
            id: defualtButton

            height: 100
            width: 200
            text: "Default Button"

            onClicked: console.log("Default button clicked")
        }
    }
}
