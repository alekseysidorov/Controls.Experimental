import QtQuick 2.2

import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Rectangle {
    id: view

    property alias currentIndex: sideBar.currentIndex
    property alias currentItem: d.currentItem
    property alias header: headerLoader.sourceComponent
    property alias items: d.items

    property alias sideBarMinimumWidth: sideBar.minimumWidth
    property alias footer: sideBar.footer

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
            //contentLoader.sourceComponent = c.sourceComponent;
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

            Loader {
                id: headerLoader

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                height: item ? item.implicitHeight : 0
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: headerLoader.bottom
                anchors.bottom: parent.bottom

                clip: true

                StackView {
                    id: stack

                    anchors.fill: parent
                    smooth: true
                    delegate: StackViewDelegate {
                        function transitionFinished(properties)
                        {
                            properties.exitItem.opacity = 1
                        }

                        pushTransition: StackViewTransition {
                            PropertyAnimation {
                                target: enterItem
                                property: "opacity"
                                from: 0
                                to: 1
                            }
                            PropertyAnimation {
                                target: exitItem
                                property: "opacity"
                                from: 1
                                to: 0
                            }
                        }
                    }
                }
            }
        }

    }

    SystemPalette { id: systemPalette }
}

