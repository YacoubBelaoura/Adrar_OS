import QtQuick 2.7
import QtQuick.Window 2.0
import QtWebEngine 1.3

Window {
    id: root

    //    flags: Qt.FramelessWindowHint
    width: 640
    height: 480
    color: "black"
    title: webView.title

    Rectangle{
        anchors.fill: parent
        color: "grey"

        WebEngineView{
            id: webView

            anchors.fill: parent
            url: "./webTest/main.html"
            onNewViewRequested: {console.log("hello there a new window need to be opend")}
        }
        MouseArea {
            // to disable the mouse right click on WevView
            anchors.fill: parent
            acceptedButtons: Qt.RightButton
            onClicked: { mouse.button === Qt.RightButton ? console.log("right mouse ") : console.log("left mouse ")}
        }
    }
}
