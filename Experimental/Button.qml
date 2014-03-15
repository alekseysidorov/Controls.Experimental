import QtQuick 2.1
import QtQuick.Controls 1.0 as Controls

Controls.Button {
    id: button

    Binding {
        target: action
        value: button.pressed
        property: "pressed"
    }
}

