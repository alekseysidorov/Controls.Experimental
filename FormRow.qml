import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0

Item {
    id: row

    property alias title: label.text
    default property alias data: loader.sourceComponent

    implicitHeight: childrenRect.height
    implicitWidth: label.implicitWidth + loader.implicitWidth

    Label {
        id: label

        anchors.right: parent.horizontalCenter
    }

    Loader {
        id: loader

        anchors.left: parent.horizontalCenter
    }
}
