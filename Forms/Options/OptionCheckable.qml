import QtQuick 2.0
import QtQuick.Controls 1.1

import Controls.Forms 1.0

Option {
    id: control

    property bool checked
    property string title

    style: FormRow {
        title: control.title + ": "

        Switch {
            id: switchItem

            checked: control.checked

            Binding {
                target: control
                property: "checked"
                value: switchItem.checked
            }
        }
    }
}
