import QtQuick 2.1

import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls.Private 1.0

ButtonStyle {
    id: style

    property int iconStyle: Qt.ToolButtonTextUnderIcon

    background: Item {}
    label: Loader {
        anchors.centerIn: parent
        clip: true

        sourceComponent: {
            if (!control.iconSource)
                return textComponent;

            switch (style.iconStyle) {
            case Qt.ToolButtonIconOnly:
                return icon;
            case Qt.ToolButtonTextUnderIcon:
                return textUnderIconComponent;
            case Qt.ToolButtonIconOnly:
                return icon;
            }
            return textComponent;
        }
    }

    property Component icon: Component {
        Image {
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
                sourceComponent: icon
            }

            Loader {
                Layout.fillWidth: true
                anchors.horizontalCenter: parent.horizontalCenter
                sourceComponent: textComponent
            }
        }
    }
}
