import QtQuick
import QtQuick.Controls.Basic

Page {
    id: mainPage

    header: TabBar {
        id: tabBar

        currentIndex: swipeView.currentIndex

        TabButton {
            text: "2000 - 2008"
            onClicked: { swipeView.currentIndex = 0}
        }

        TabButton {
            text: "2008 - 2014"
            onClicked: { swipeView.currentIndex = 1}
        }

        TabButton {
            text: "2014 - 2016"
            onClicked: { swipeView.currentIndex = 2}
        }

        TabButton {
            text: "2016 - 2020"
            onClicked: { swipeView.currentIndex = 3}
        }

        TabButton {
            text: "2020 - present"
            onClicked: { swipeView.currentIndex = 4}
        }
    }

    footer: Rectangle {
        height: 30
        width: mainPage.width
        color: "lightgray"

        PageIndicator {
            anchors.centerIn: parent
            count: swipeView.count
            currentIndex: swipeView.currentIndex
        }
    }

    SwipeView {
        id: swipeView

        anchors.fill: parent

        Item {
            Image {
                anchors.centerIn: parent
                height: parent.height
                width: height
                source: "../QtLogos/Qt_20-28.png"
            }
        }

        Item {
            Image {
                anchors.centerIn: parent
                height: parent.height
                width: height
                source: "../QtLogos/Qt_28-14.svg"
            }
        }

        Item {
            Image {
                anchors.centerIn: parent
                height: parent.height
                width: height
                source: "../QtLogos/Qt_14-16.svg"
            }
        }

        Item {
            Image {
                anchors.centerIn: parent
                height: parent.height
                width: height * 1.33
                source: "../QtLogos/Qt_16-20.svg"
            }
        }

        Item {
            Image {
                anchors.centerIn: parent
                height: parent.height
                width: height
                source: "../QtLogos/Qt_20-present.svg"
            }
        }
    }
}
