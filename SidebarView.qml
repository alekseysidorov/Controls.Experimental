import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: view

    property alias currentIndex: sideBar.currentIndex
    property alias currentItem: d.currentItem
    property alias header: headerLoader.sourceComponent
    property alias items: d.items

    default property alias data: d.items

    Item {
        id: d

        property Item currentItem: items[view.currentIndex]
        property list<Item> items

        function updateItem() {
            var c = currentItem;
            if (c) {
                replaceItem(c);
            }
        }

        function replaceItem(c) {
            c.active = true;
            if (c.status === Loader.Ready) {
                stack.push({item:c, replace: true});
            }
        }

        onCurrentItemChanged: updateItem()

        Connections {
            target: d.currentItem

            onStatusChanged: {
                d.replaceItem(d.currentItem);
            }
        }
    }

    SplitView {
        anchors.fill: parent

        Sidebar {
            id: sideBar

            sidebarItems: view.items
        }

        Rectangle {
            id: contentArea
            color: systemPalette.base

            //Loader {
            //    id: headerLoader

            //    anchors.left: parent.left
            //    anchors.right: parent.right
            //    anchors.top: parent.top

            //    height: item ? item.implicitHeight : 0
            //}

            //Item {
            //    anchors.left: parent.left
            //    anchors.right: parent.right
            //    anchors.top: headerLoader.bottom
            //    anchors.bottom: parent.bottom

            //    clip: true

            //    Loader {
            //        id: contentLoader

            //        anchors.fill: parent
            //    }
            //}

            ColumnLayout {
                anchors.fill: parent

                Loader {
                    id: headerLoader

                    Layout.fillWidth: true
                    height: item ? item.implicitHeight : 0
                }

                StackView {
                    id: stack
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                }
            }
        }

    }

    SystemPalette { id: systemPalette }

    Units { id: units }
}

