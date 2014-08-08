import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.1

import Controls 1.0

ScrollView {
    id: root

    property bool fillHeight: false
    property int margins: Units.gu(2)

    default property alias data: layout.data

    Item {
        id: container
        width: root.viewport.width
        height: Math.max(layout.implicitHeight + 2*root.margins, root.height)

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
}
