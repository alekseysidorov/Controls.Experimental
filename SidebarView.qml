import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: view

    property alias currentIndex: sideBar.currentIndex
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

        Sidebar {
            id: sideBar

            sidebarItems: d.children
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

