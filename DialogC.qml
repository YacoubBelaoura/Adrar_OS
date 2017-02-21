import QtQuick 2.6
import QtGraphicalEffects 1.0
import QtQuick.Window 2.0

Window {
    id: root

    property int topHeight: 30
    property alias separator: separaId // this to get anchors for the separator of top bar and Main
    property int wWidth: 400
    property int hHeight: 300
    property double shadowRadius: 20
    property color gradientStopColor0: "#E6E5E6" //"#3E3F41" //"#f1f1f1" "#ecebec"  "#E6E5E6"
    property color gradientStopColor1: "#d6d5d6" //"#313131" //"#b8b7b7" "#d6d5d6"
    property color borderColor: "#B4B2B3" //"#313131" // "#7a7a7a" "#B4B2B3"
    property color backGroundColor: "#ffffff"//"#4D4D4D" // "#ffffff" "#"

    width: wWidth + 30
    height: hHeight + 30
    color: "transparent"
    flags: "FramelessWindowHint"
    // this code make the shadow on or off
    onFocusObjectChanged: root.active ? container.state = ""  : container.state = "nonActive"

    Item {
        id: container
        anchors.fill: parent

        // shadowSource is for that shadow effect
        Rectangle{
            id: shadowSource

            anchors.fill: windowBorder
            color: "grey"
            radius: 30
        }
        // for shadowSource
        DropShadow{
            id: shadowId

            source: shadowSource
            anchors.fill: shadowSource
            radius: shadowRadius
            samples:  1 + shadowId.radius * 2
            color: "#80000000"
            opacity: 1
        }

        Rectangle {
            id: windowBorder

            width: wWidth
            height: hHeight
            radius: 5
            border.width: 1
            border.color: windowTitleBar.enabled ? borderColor : Qt.lighter(borderColor)
            anchors.centerIn: parent
            color: windowTitleBar.enabled ? backGroundColor : Qt.lighter(backGroundColor) //"transparent"

            MouseArea {
                id: testId

                anchors.fill: parent
            }
        }

        Rectangle{
            id: windowTitleBar

            width: windowBorder.width - 2
            height: topHeight
            radius: windowBorder.radius
            gradient: Gradient {
                GradientStop { position: 0.0; color: windowTitleBar.enabled ? gradientStopColor0 : Qt.lighter(gradientStopColor0,1.8) }
                GradientStop { position: 0.85; color: windowTitleBar.enabled ? gradientStopColor1 : Qt.lighter(gradientStopColor1,1.8) }}
            anchors.horizontalCenter: windowBorder.horizontalCenter
            anchors.top: windowBorder.top
            anchors.topMargin: 1

            Rectangle {
                id: separaId

                width: parent.width
                height: 5
                color: windowTitleBar.enabled ? gradientStopColor1 : Qt.lighter(gradientStopColor1,1.8)
                anchors.bottom: windowTitleBar.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea{
                id: titleWindowMouseId

                property variant clickPos: "1,1"

                anchors.fill: parent
                cursorShape: titleWindowMouseId.containsMouse ?  Qt.SizeAllCursor : Qt.ArrowCursor
                onPressed: {
                    clickPos  = Qt.point(mouse.x,mouse.y)
                }
                onPositionChanged: {
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    root.x += delta.x;
                    root.y += delta.y;
                }
            }
        }

        Traffic_button {
            id: trafficCloseButton

            onClicked: root.close()
            anchors.verticalCenter: windowTitleBar.verticalCenter
            anchors.right: windowTitleBar.right
            anchors.rightMargin: 10
        }
        // Component "resizer" to resize our Window bottom right corner
        Image {
            id: resizer

            width: 15
            height: 15
            anchors.bottom: windowBorder.bottom
            anchors.right: windowBorder.right
            anchors.bottomMargin: 2
            anchors.rightMargin: 2
            source: "images/resizeWindow2.png"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SizeFDiagCursor
                onPositionChanged: {
                    root.wWidth = Math.abs(root.wWidth + mouse.x) <= 150 ? 150 :  Math.abs(root.wWidth + mouse.x);
                    root.hHeight = Math.abs(root.hHeight + mouse.y) <= 150 ? 150 :  Math.abs(root.hHeight + mouse.y);
                }
            }
        }

        states: [
            State {
                name: "nonActive"
                PropertyChanges {
                    target: shadowId
                    opacity: 0.3
                }
                PropertyChanges {
                    target: trafficCloseButton
                    enabled: false
                }
                PropertyChanges {
                    target: windowTitleBar
                    enabled: false
                }
            }
        ]
        transitions: [
            Transition {
                from: "*"
                to: "*"
                PropertyAnimation {
                    target: shadowId;
                    properties: "opacity";
                    duration: 200;
                    easing.type: Easing.InCurve }
            }
        ]
    }
}
