import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0

Item {
    id: row

    property alias title: label.text
    default property alias data: loader.sourceComponent

    implicitHeight: Math.max(label.implicitHeight, loader.implicitHeight)
    implicitWidth: label.implicitWidth + loader.implicitWidth + units.gu(3)

    Label {
        id: label

        anchors.right: parent.horizontalCenter
        anchors.rightMargin: units.gu(1)
        elide: Text.ElideRight
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        height: Math.max(implicitHeight, loader.implicitHeight)
    }

    Loader {
        id: loader

        anchors.left: parent.horizontalCenter
        //anchors.right: parent.right
        //anchors.rightMargin: units.gu(1)
    }

    Units {
        id: units
    }
}
