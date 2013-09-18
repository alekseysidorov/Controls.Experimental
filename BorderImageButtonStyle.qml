import QtQuick 2.0

IconButtonStyleBase {
    id: style

    property url backgroundSource

    background: BorderImage {
        source: control.backgroundSource ? control.backgroundSource : style.backgroundSource

        border.left: 5; border.top: 5
        border.right: 5; border.bottom: 5
    }
}
