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

            var iconStyle = control.iconStyle;
            if (iconStyle === undefined)
                iconStyle = style.iconStyle;

            switch (iconStyle) {
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
            sourceSize.width: control.iconSize ? control.iconSize : undefined

            fillMode: Image.PreserveAspectFit
            source: control.iconSource
            smooth: true
            opacity: enabled ? 1 : 0.5
        }
    }
    property Component textComponent: Label {
        id: text
        text: control.text
        wrapMode: Text.WordWrap
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideMiddle
    }

    Component {
        id: textUnderIconComponent

        ColumnLayout {
            Item {
                Layout.fillWidth: true
                Layout.maximumHeight: 1
            }
            Loader {
                Layout.fillHeight: control.iconSize === undefined
                anchors.horizontalCenter: parent.horizontalCenter
                sourceComponent: icon
            }

            Loader {
                Layout.fillWidth: true
                anchors.horizontalCenter: parent.horizontalCenter
                sourceComponent: textComponent
            }
            Item {
                Layout.fillWidth: true
                Layout.maximumHeight: 1
            }
        }
    }
}
