import QtQuick 1.1
import "UIConstants.js" as UI
import com.nokia.meego 1.0

//Item {
//    id: root

//    property alias name: name.text
//    property alias value: value.text
//    property alias valueX: value.x

//    width: parent ? parent.width : 200
//    height: childrenRect.height

//    Label {
//        id: name
//        text: qsTr("Value name:")
//        anchors.right: value.left
//        anchors.rightMargin: UI.DEFAULT_MARGIN

//        color: UI.COLOR_INVERTED_SECONDARY_FOREGROUND
//        font.pixelSize: UI.FONT_DEFAULT_SIZE
//    }

//    Label {
//        id: value

//        x: Math.max(name.width + UI.DEFAULT_MARGIN, root.width * 0.4 + UI.DEFAULT_MARGIN)
//        text: "42"

//        color: UI.COLOR_INVERTED_FOREGROUND
//        font.pixelSize: UI.FONT_DEFAULT_SIZE
//    }
//}

FormField {
    id: root

    property alias value: value.text

    item: Label {
        id: value
        text: "42"

        color: UI.COLOR_INVERTED_FOREGROUND
        font.pixelSize: UI.FONT_DEFAULT_SIZE
    }
}
