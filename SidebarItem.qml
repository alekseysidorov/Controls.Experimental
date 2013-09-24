import QtQuick 2.1

import QtQuick.Controls 1.0

Tab {
    id: tab

    property string iconName
    property url iconSource: iconName ? "image://desktoptheme/" + iconName : ""

    property string description
    property string section

    property Component sidebarDelegate

    anchors.fill: undefined
}
