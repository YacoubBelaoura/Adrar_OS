import QtQuick 2.6

Item {
    id: root

    width: 22
    height: 22
    onEnabledChanged: root.enabled == false ? root.state = "disabled" : root.state = "static"

    signal clicked()

    Image {
        id: normal
        source: "images/red_1static.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        opacity: root.state == "down" ? 0 : 1
    }
    Image {
        id: trafficButtonImage
        source: "images/red_1static.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        opacity: 0
    }

    MouseArea {
        id: ariea

        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.state = "hover"
        onExited: root.state = "static"
        onClicked: {root.state = "down"; root.clicked();}
    }

    states: [
        State {
            name: "static"
            PropertyChanges {
                target: trafficButtonImage

                opacity: 0
                source: "images/red_1static.png"
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: trafficButtonImage

                opacity: 1
                source: "images/red_2hover.png"
                scale: 1.1
            }
        },
        State {
            name: "down"
            PropertyChanges {
                target: trafficButtonImage

                opacity: 1
                source: "images/red_3down.png"
            }
        },
        State {
            name: "disabled"
            PropertyChanges {
                target: trafficButtonImage

                opacity: 1
                source: "images/redL_4disabled.png"
            }
            PropertyChanges {
                target: normal

                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"

            PropertyAnimation {
                target: trafficButtonImage;
                properties: "opacity, scale";
                duration: 200;
                easing.type: Easing.InExpo
            }
            PropertyAnimation {
                target: normal;
                properties: "opacity";
                duration: 200;
                easing.type: Easing.OutExpo
            }
        }
    ]
}
