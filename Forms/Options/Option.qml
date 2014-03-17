import QtQuick 2.0
import QtQuick.Layouts 1.1

Loader {
    id: control

    property alias style: control.sourceComponent

    Layout.fillWidth: true
}
