import QtQuick 2.1

import QtQuick.Controls 1.0

Item {
    id: sidebarItem

    property string iconName
    property url iconSource: iconName ? "image://desktoptheme/" + iconName : ""

    property string description
    property string section
    property string title

    property Component sidebarDelegate

    property alias sourceComponent: contentLoader.sourceComponent
    property alias active: contentLoader.active
    property alias asynchronous: contentLoader.asynchronous
    property alias status: contentLoader.status

    Accessible.role: Accessible.LayeredPane
    visible: false

    activeFocusOnTab: false

    onVisibleChanged: if (visible) active = true

    /*! \internal */
    default property alias component: sidebarItem.sourceComponent

    Loader {
        id: contentLoader
        anchors.fill: parent
        active: false
        asynchronous: true
    }
}
