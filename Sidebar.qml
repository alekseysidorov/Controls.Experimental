import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: sideBarArea

    property alias currentIndex: view.currentIndex
    property Item currentItem: sidebarItems[currentIndex]
    property alias sidebarItems: view.model

    /*! internal */
    readonly property bool __mac: Qt.platform.os === "osx"
    property int __iconSize: units.gu(4)

    color: systemPalette.window
    clip: true
    Layout.minimumWidth: units.gu(40)

    Component {
        id: sideBarComp

        Rectangle {
            implicitHeight: units.gu(6)

            color: selected ? (__mac ? Qt.darker(systemPalette.highlight, 1.5) : systemPalette.highlight)
                            : "transparent"

            /// Tested on Ubuntu style.
            /// TODO test it on mac and windows styles

            //gradient: selected ? gradient : noGradient

            //Gradient {
            //    id: gradient

            //    GradientStop { position: 0; color: systemPalette.highlight }
            //    GradientStop { position: 1; color: Qt.lighter(systemPalette.highlight, 1.1) }
            //}

            //Gradient {
            //    id: noGradient
            //    GradientStop { position: 1; color: "transparent" }
            //}

            //Rectangle {
            //    anchors.fill: parent
            //    color: __mac ? Qt.darker(systemPalette.highlight, 1.5) : systemPalette.highlight
            //    opacity: hovered ? 0.1 : 0
            //}

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: units.gu(4)

                Image {
                    source: model.iconSource

                    Layout.minimumWidth: __iconSize
                    Layout.maximumWidth: __iconSize
                    Layout.maximumHeight: __iconSize

                    anchors.verticalCenter: parent.verticalAlignment
                }

                Label {
                    Layout.fillWidth: true

                    color: selected ? (__mac ? systemPalette.base : systemPalette.highlightedText)
                                    : systemPalette.windowText
                    text: model.title
                    maximumLineCount: 1
                    elide: Text.ElideRight
                }
            }

            //Rectangle {
            //id: hrt

            //height: 1
            //anchors {
            //    left: parent.left
            //    right: parent.right
            //    top: parent.top
            //}

            //color: selected ? Qt.darker(systemPalette.highlight) : "transparent"
            //}

            //Rectangle {
            //id: hrb

            //height: 1
            //anchors {
            //    left: parent.left
            //    right: parent.right
            //    bottom: parent.bottom
            //}

            //color: selected ? Qt.darker(systemPalette.highlight) : "transparent"
            //}
        }
    }

    ListView {
        id: view

        anchors.fill: parent
        anchors.topMargin: units.gu(1)
        model: d.children
        interactive: false

        section.property: "section"
        section.delegate: Label {
            height: units.gu(6)

            anchors {
                left: parent.left
                right: parent.right
                leftMargin: units.gu(4)
            }

            text: section
            font.bold: true
            verticalAlignment: Text.AlignVCenter
        }

        delegate: Loader {
            readonly property bool selected: currentIndex === index
            readonly property QtObject model: modelData
            readonly property bool hovered: area.containsMouse

            sourceComponent: model.sidebarDelegate ? model.sidebarDelegate : sideBarComp
            height: item ? item.implicitHeight : units.gu(8)
            anchors {
                left: parent.left
                right: parent.right
            }

            MouseArea {
                id: area

                anchors.fill: parent
                hoverEnabled: true
                enabled: sidebarItems[index].sourceComponent

                onClicked: currentIndex = index
            }
        }
    }

    Units {
        id: units
    }

    SystemPalette {
        id: systemPalette
    }
}
