import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

Window {
    id: root
    width: 300; height: 480
    visible: true
    title: qsTr("Planets")

    Rectangle {
        id: background
        anchors.fill: parent

        Label {
            id: exitMsg
            anchors.fill: parent
            anchors.topMargin: 100

            horizontalAlignment: Text.AlignHCenter
            text: "Bye!"

            opacity: 0
        }

        gradient: Gradient {
            GradientStop { id: color1; position: 0.0; color: "#a4a4a4" }
            GradientStop { id: color2; position: 1.0; color: "#2b2b2b" }
        }
    }
    


    ListView {
        id: listView
        anchors.fill: parent
        anchors.topMargin: toolBar.height
        anchors.horizontalCenter: background.horizontalCenter

        model: planets
        delegate: planetsDelegate
    }

    ListModel {
        id: planets

        ListElement {
            name: "Mercury"
            imageSource: "images/mercury.jpeg"
            description: "The first planet from the Sun and the smallest in the Solar System. In English, it is named after the Roman god Mercurius (Mercury), god of commerce and communication, and the messenger of the gods. Mercury is classified as a terrestrial planet, with roughly the same surface gravity as Mars. The surface of Mercury is heavily cratered, as a result of countless impact events that have accumulated over billions of years. Its largest crater, Caloris Planitia, has a diameter of 1,550 km (960 mi) and one-third the diameter of the planet (4,880 km or 3,030 mi). Similarly to the Earth's Moon, Mercury's surface displays an expansive rupes system generated from thrust faults and bright ray systems formed by impact event remnants."
        }

        ListElement {
            name: "Venus"
            imageSource: "images/venus.jpeg"
            description: "The second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the closest in mass and size to its orbital neighbour Earth. Orbiting inferiorly (inside of Earth's orbit), it always appears close to the Sun in Earth's sky, as either a 'morning star' or an 'evening star'. While this is also true for Mercury, Venus appears more prominent, since it is the third brightest object in Earth's sky after the Moon and the Sun. Venus has historically been a common and important object for humans, in both their cultures and astronomy."
        }

        ListElement {
            name: "Earth"
            imageSource: "images/earth.jpeg"
            description: "The third planet from the Sun and the only astronomical object known to harbor life. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water. Almost all of Earth's water is contained in its global ocean, covering 70.8% of Earth's crust. The remaining 29.2% of Earth's crust is land, most of which is located in the form of continental landmasses within one hemisphere, Earth's land hemisphere. Most of Earth's land is somewhat humid and covered by vegetation, while large sheets of ice at Earth's polar deserts retain more water than Earth's groundwater, lakes, rivers and atmospheric water combined. Earth's crust consists of slowly moving tectonic plates, which interact to produce mountain ranges, volcanoes, and earthquakes. Earth has a liquid outer core that generates a magnetosphere capable of deflecting most of the destructive solar winds and cosmic radiation."
        }

        ListElement {
            name: "Mars"
            imageSource: "images/mars.jpeg"
            description: "The fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname 'the Red Planet'. Mars is among the brightest objects in Earth's sky and its high-contrast albedo features have made it a common subject for telescope viewing. It is classified as a terrestrial planet and is the second smallest of the Solar System's planets with a diameter of 6,779 km (4,212 mi). In terms of orbital motion, a Martian solar day (sol) is equal to 24.5 hours and a Martian solar year is equal to 1.88 Earth years (687 Earth days). Mars has two natural satellites that are small and irregular in shape: Phobos and Deimos."
        }

        ListElement {
            name: "Jupiter"
            imageSource: "images/jupiter.jpeg"
            description: "The fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter orbits the Sun at a distance of 5.20 AU (778.5 Gm) with an orbital period of 11.86 years. Jupiter is the third brightest natural object in the Earth's night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion."
        }

        ListElement {
            name: "Saturn"
            imageSource: "images/saturn.jpeg"
            description: "The sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive. Even though Saturn is nearly the size of Jupiter, Saturn has less than one-third of Jupiter's mass. Saturn orbits the Sun at a distance of 9.59 AU (1,434 million km) with an orbital period of 29.45 years."
        }

        ListElement {
            name: "Uranus"
            imageSource: "images/uranus.jpeg"
            description: "The seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which in astronomy is called 'ice' or volatiles. The planet's atmosphere has a complex layered cloud structure and has the lowest minimum temperature of 49 K (−224 °C; −371 °F) out of all the Solar System's planets. It has a marked axial tilt of 82.23° with a retrograde rotation period of 17 hours and 14 minutes. This means that in an 84-Earth-year orbital period around the Sun, its poles get around 42 years of continuous sunlight, followed by 42 years of continuous darkness."
        }

        ListElement {
            name: "Neptune"
            imageSource: "images/neptune.jpeg"
            description: "The eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than fellow ice giant Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere. Being composed primarily of gases and liquids, it has no well-defined solid surface. The planet orbits the Sun once every 164.8 years at an orbital distance of 30.1 astronomical units (4.5 billion kilometres; 2.8 billion miles). It is named after the Roman god of the sea and has the astronomical symbol ♆, representing Neptune's trident."
        }
    }

    Component {
        id: planetsDelegate

        Item {
            id: wrapper
            width: listView.width; height: 30

            required property string name
            required property string imageSource
            required property string description

            Rectangle {
                id: planetBackground

                height: 30
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                color: "#333"
                border.color: Qt.lighter(color, 1.5)

                Text {
                    id: planetTitle

                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4

                    font.pixelSize: parent.height - 4
                    color: "#fff"

                    text: wrapper.name
                }
            }

            Rectangle {
                id: image
                width: 26; height: 26
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 2
                anchors.topMargin: 2

                color: "black"

                Image {
                    anchors.fill: parent

                    fillMode: Image.PreserveAspectFit
                    source: wrapper.imageSource
                }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: parent.state = "expanded"
            }

            Flickable {
                id: factsView
                anchors.top: image.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                clip: true
                contentY: desc.y
                contentHeight: desc.height / 2

                opacity: 0

                Rectangle {
                    id: factsWrapper
                    anchors.fill: parent

                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#fed958" }
                        GradientStop { position: 1.0; color: "#fecc2f" }
                    }

                    border.color: "#000000"
                    border.width: 2

                    Text {
                        id: desc
                        anchors.fill: parent
                        anchors.margins: 5
                        clip: true

                        wrapMode: Text.WordWrap
                        color: "#1f1f21"

                        font.pixelSize: 12

                        text: wrapper.description
                    }
                }
            }

            Rectangle {
                id: closeButton
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 2
                anchors.rightMargin: 2
                width: 26; height: 26

                color: "red"
                border.color: Qt.lighter(color, 1.2)

                opacity: 0

                MouseArea {
                    anchors.fill: parent
                    onClicked: wrapper.state = ""
                }
            }

            states: [
                State {
                    name: "expanded"

                    PropertyChanges {
                        target: wrapper

                        height: listView.height
                    }

                    PropertyChanges {
                        target: image

                        width: listView.width; height: listView.width
                        anchors.rightMargin: 0
                        anchors.topMargin: 30
                    }

                    PropertyChanges {
                        target: factsView

                        opacity: 1
                    }

                    PropertyChanges {
                        target: closeButton

                        opacity: 1
                    }

                    PropertyChanges {
                        target: wrapper.ListView.view

                        contentY: wrapper.y
                        interactive: false
                    }
                }
            ]

            transitions: [
                Transition {
                    NumberAnimation {
                        properties: "height, width, anchors.rightMargin, anchors.topMargin, opacity, contentY"
                        duration: 200
                    }
                }

            ]
        }
     }

    ToolBar {
        id: toolBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 30

        Rectangle {
            anchors.fill: parent

            color: "darkGray"
        }

        Drawer {
            id: drawer
            width: Math.min(root.width, root.height) / 3 * 2
            height: root.height

            ListView {
                anchors.fill: parent

                focus: true
                currentIndex: -1

                delegate: ItemDelegate {
                    width: parent.width
                    height: 30

                    text: model.text
                    highlighted: ListView.isCurrentItem

                    onClicked: {
                        drawer.close()
                        model.triggered()
                    }
                }

                model: ListModel {
                    ListElement {
                        text: qsTr("Source...")
                        triggered: function() { Qt.openUrlExternally("https://en.wikipedia.org/wiki/Planet") }
                    }

                    ListElement {
                        text: qsTr("About...")
                        triggered: function() { aboutDialog.open() }
                    }

                    ListElement {
                        text: qsTr("Quit...")
                        triggered: function() {
                            quitDialog.open();
                        }
                    }
                }
            }
        }

        ToolButton {
            id: menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter

            icon.source: "images/menu_white.svg"
            onClicked: drawer.open()
        }

        Label {
            anchors.centerIn: parent

            text: "Planets information"

            font.pixelSize: 20
            elide: Label.ElideRight
        }
    }

    Dialog {
        id: aboutDialog
        title: qsTr("About")

        width: 150; height: 240

        Label {
            id: aboutText
            anchors.fill: parent

            text: qsTr("Planet information show application made by BudzioT (Bartosz Budnik)")
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap

            opacity: 0
        }

        onOpened: aboutTextAppear.start()

        SequentialAnimation {
            id: aboutTextAppear

            NumberAnimation {
                target: aboutText
                property: "opacity"
                from: 0; to: 1
                duration: 1000
            }

            ParallelAnimation {
                NumberAnimation {
                    target: aboutText
                    property: "font.pixelSize"
                    from: aboutText.font.pixelSize
                    to: aboutText.font.pixelSize * 1.5

                    duration: 2000
                }


                ColorAnimation {
                    target: aboutText
                    property: "color"

                    to: "cyan"
                    duration: 1000
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: aboutText
                    property: "font.pixelSize"
                    from: aboutText.font.pixelSize
                    to: aboutText.font.pixelSize / 1.1

                    duration: 1000
                }


                ColorAnimation {
                    target: aboutText
                    property: "color"

                    to: "black"
                    duration: 500
                }
            }
        }

        standardButtons: Dialog.Ok
    }

    Platform.MessageDialog {
        id: quitDialog
        title: qsTr("Closing...")

        text: "Are you sure, you want to quit?"

        buttons: Platform.MessageDialog.Yes | Platform.MessageDialog.No

        onYesClicked: {
            quitAnim.start()
        }

        SequentialAnimation {
            id: quitAnim
            loops: 1

            NumberAnimation {
                target: background
                property: "z"
                to: 1

                duration: 1000
            }


            ColorAnimation {
                target: color1
                property: "color"
                to: "white"

                duration: 1000
            }

            ParallelAnimation {

                NumberAnimation {
                    target: exitMsg
                    property: "opacity"
                    to: 1

                    duration: 1000
                }

                NumberAnimation {
                    target: exitMsg
                    property: "font.pointSize"
                    from: exitMsg.font.pointSize
                    to: exitMsg.font.pointSize * 2

                    duration: 2000
                }
            }

            onFinished: function () { Qt.quit(); }
        }
    }
}
