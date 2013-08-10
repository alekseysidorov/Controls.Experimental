import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: view

    property int currentIndex: 0
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

                Rectangle {
                    implicitHeight: units.gu(8)

                    color: selected ? systemPalette.highlight : "transparent"

                    RowLayout {
                        anchors.fill: parent

                        Image {
                            source: model.iconSource

                            width: units.gu(4)
                            height: width
                        }

                        Label {
                            Layout.fillWidth: true

                            color: selected ? systemPalette.highlightedText : systemPalette.windowText
                            text: model.title
                            renderType: Text.NativeRendering
                        }
                    }
                }
            }

            ListView {
                anchors.fill: parent
                model: d.children

                delegate: Loader {
                    readonly property bool selected: currentIndex === index
                    property QtObject model: modelData

                    sourceComponent: model.sidebarDelegate ? model.sidebarDelegate : sideBarComp
                    width: parent.width
                    height: item ? item.implicitHeight : units.gu(8)

                    MouseArea {
                        anchors.fill: parent

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

