import QtQuick 2.0
import QtQuick.Controls 1.1

import Controls.Forms 1.0

Option {
    id: control

    property string title
    property string text
    property QtObject validator

    signal accepted

    style: FormRow {
        title: control.title

        TextField {
            id: textField

            onAccepted: {
                control.text = textField.text;
                control.accepted();
            }


            text: control.text
            validator: control.validator

            Binding {
                target: control
                property: textField.text
                value: "text"
            }
        }
    }
}
