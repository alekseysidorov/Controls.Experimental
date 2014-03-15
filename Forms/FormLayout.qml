import QtQuick 2.1
import QtQuick.Layouts 1.0

import Controls 1.0

Item {
    id: root

    property bool fillHeight: false
    property int margins: Units.gu(2)

    default property alias data: layout.data

    ColumnLayout {
        id: layout

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: root.fillHeight ? parent.bottom : undefined
            margins: root.margins
        }

        spacing: Units.gu(2)
        Layout.fillWidth: true
    }

}
