import QtQuick 2.0
import QtQuick.Controls 1.1

import Controls.Forms 1.0

Option {
    id: control

    property string title
    property real value
    property real maximumValue
    property real minimumValue
    property int decimals

    style: FormRow {
        title: control.title

        SpinBox {
            id: spinBox

            value: control.value
            maximumValue: control.maximumValue
            minimumValue: control.minimumValue
            decimals: control.decimals

            Binding {
                target: control
                property: spinBox.value
                value: "value"
            }
        }
    }
}
