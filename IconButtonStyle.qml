import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0

IconButtonStyleBase {
    id: style

    background: StyleItem {
        id: styleitem
        elementType: "button"
        sunken: control.pressed || (control.checkable && control.checked)
        raised: !(control.pressed || (control.checkable && control.checked))
        hover: control.hovered
        hasFocus: control.activeFocus
        hints: control.styleHints
        // If no icon, let the style do the drawing
        activeControl: control.isDefault ? "default" : "f"

        properties: {
            "menu": control.menu
        }
    }
}
