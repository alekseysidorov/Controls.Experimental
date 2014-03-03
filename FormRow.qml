import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0

import Controls.Experimental 1.0

Loader {
    id: control

    property string title
    property Component content

    property alias style: control.sourceComponent

    /*! internal */
    default property alias data: control.content

    sourceComponent: Qt.platform.os === "android" ? mobileRowStyle : desktopRowStyle
    Layout.fillWidth: true

    Component {
        id: desktopRowStyle

        Item {
            id: row

            implicitHeight: Math.max(label.implicitHeight, loader.implicitHeight)
            implicitWidth: label.implicitWidth + loader.implicitWidth + Units.gu(3)

            Label {
                id: label

                anchors.right: parent.horizontalCenter
                anchors.rightMargin: Units.gu(1)
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                height: Math.max(implicitHeight, loader.implicitHeight)
                text: control.title
            }

            Loader {
                id: loader

                anchors.left: parent.horizontalCenter
                sourceComponent: control.content
                //anchors.right: parent.right
                //anchors.rightMargin: Units.gu(1)
            }
        }
    }

    Component {
        id: mobileRowStyle

        Row {
            id: row

            spacing: Units.gu(2)

            Label {
                id: label

                elide: Text.ElideRight
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                height: Math.max(implicitHeight, loader.implicitHeight)
                text: control.title
            }

            Loader {
                id: loader

                sourceComponent: control.content
            }
        }
    }
}

