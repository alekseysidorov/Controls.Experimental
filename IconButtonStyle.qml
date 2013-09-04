import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0

ButtonStyle {
    id: style

    property int iconStyle: Qt.ToolButtonTextUnderIcon

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
    label: Loader {
        anchors.fill: parent
        clip: true

        sourceComponent: {
            if (!control.iconSource)
                return textComponent;

            switch (style.iconStyle) {
            case Qt.ToolButtonIconOnly:
                return iconComponent;
            case Qt.ToolButtonTextUnderIcon:
                return textUnderIconComponent;
            case Qt.ToolButtonIconOnly:
                return iconComponent;
            }
            return textComponent;
        }
    }

    property Component iconComponent: Component {
        Image {
            width: style.iconSize
            fillMode: Image.PreserveAspectFit
            source: control.iconSource
            smooth: true
            opacity: enabled ? 1 : 0.5
        }
    }

    Component {
        id: textComponent

        Label {
            id: text
            text: control.text
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Component {
        id: textUnderIconComponent

        ColumnLayout {
            Loader {
                Layout.fillHeight: true
                anchors.horizontalCenter: parent.horizontalCenter
                sourceComponent: iconComponent
            }

            Loader {
                Layout.fillWidth: true
                anchors.horizontalCenter: parent.horizontalCenter
                sourceComponent: textComponent
            }
        }
    }
}
