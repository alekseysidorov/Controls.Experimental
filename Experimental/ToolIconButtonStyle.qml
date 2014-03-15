import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0

IconButtonStyleBase {
    id: style

    background: StyleItem {
        id: styleitem

        anchors.fill: parent
        elementType: "toolbutton"
        on: control.checkable && control.checked
        sunken: control.pressed
        raised: !(control.checkable && control.checked) && control.hovered
        hover: control.hovered
        hasFocus: control.activeFocus
        hints: control.styleHints
    }
}
