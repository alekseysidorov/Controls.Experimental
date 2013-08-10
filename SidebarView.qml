import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: view

    property int currentIndex: 0
    property alias currentItem: d.currentItem
    property alias data: d.data

    Item {
        id: d

        property Item currentItem: children[currentIndex]
        property Item oldItem

        function update() {
            var c = currentItem;
            if (c) {
                c.active = true;
                if (c.status === Loader.Ready) {
                    stack.replace(c.item);
                } else {
                    c.statusChanged.connect(function() {
                        stack.replace(c.item);
                    });
                }
                oldItem = c;
            }
        }

        onCurrentItemChanged: update()
    }

    SplitView {
        anchors.fill: parent

        Rectangle {
            id: sideBarArea
            color: systemPalette.window
            clip: true
            Layout.minimumWidth: units.gu(30)

            Component {
                id: sideBarComp

                RowLayout {

                    Image {
                        source: model.iconSource
                        width: units.gu(4)
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.minimumHeight: units.gu(6)

                        color: selected ? systemPalette.highlight : "transparent"
                        border.color: "transparent"
                        radius: units.gu(1)

                        Label {
                            anchors.fill: parent
                            anchors.leftMargin: units.gu(1)

                            color: selected ? systemPalette.highlightedText : systemPalette.windowText
                            text: model.title
                            renderType: Text.NativeRendering
                            verticalAlignment: Text.AlignVCenter
                        }

                        Rectangle {
                            anchors.fill: parent
                            radius: parent.radius
                            opacity: hovered ? 0.2 : 0
                            color: systemPalette.highlight
                        }
                    }

                    Item {
                        Layout.minimumWidth: units.gu(1)
                    }
                }

                //Rectangle {
                //    implicitHeight: units.gu(8)

                //    color: selected ? systemPalette.highlight : "transparent"

                //    RowLayout {
                //        anchors.fill: parent

                //        Image {
                //            source: model.iconSource

                //            width: units.gu(4)
                //            height: width
                //        }

                //        Label {
                //            Layout.fillWidth: true

                //            color: selected ? systemPalette.highlightedText : systemPalette.windowText
                //            text: model.title
                //            renderType: Text.NativeRendering
                //        }
                //    }
                //}
            }

            ListView {
                anchors.fill: parent
                anchors.topMargin: units.gu(1)
                model: d.children

                section.property: "section"
                section.delegate: Label {

                    anchors {
                        left: parent.left
                        right: parent.right
                        leftMargin: units.gu(1)
                    }

                    text: section
                    color: systemPalette.shadow
                    renderType: Text.NativeRendering
                }

                delegate: Loader {
                    readonly property bool selected: currentIndex === index
                    readonly property QtObject model: modelData
                    readonly property bool hovered: area.containsMouse

                    sourceComponent: model.sidebarDelegate ? model.sidebarDelegate : sideBarComp
                    width: parent.width
                    height: item ? item.implicitHeight : units.gu(8)

                    MouseArea {
                        id: area
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: currentIndex = index
                    }
                }
            }
        }

        Rectangle {
            id: contentArea
            color: systemPalette.base
            clip: true

            StackView {
                id: stack
                anchors.fill: parent
            }
        }

    }

    SystemPalette { id: systemPalette }

    Units { id: units }
}

