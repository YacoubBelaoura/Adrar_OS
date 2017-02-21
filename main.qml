import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
//    flags: "FramelessWindowHint"
//    color: "transparent"

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page {
            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
            Button {
                id: buttonP2Id
                text: qsTr("Press Me to Exit")
                onClicked: root.close()
                anchors.centerIn: parent
            }
        }
    }
    header: Rectangle{
        width: parent.width
        height: 50
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#f1f1f1" }
            GradientStop { position: 1.0; color: "#b8b7b7" }}
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
