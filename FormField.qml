import QtQuick 1.1
import "UIConstants.js" as UI
import com.nokia.meego 1.0

Item {
    id: root

    property alias name: name.text
    property real __valueX: Math.max(name.width + UI.DEFAULT_MARGIN, root.width * 0.4 + UI.DEFAULT_MARGIN)
    property Item item: Item {}

    width: parent ? parent.width : 200
    height: childrenRect.height

    Label {
        id: name
        text: qsTr("Value name:")
        anchors.right: item.left
        anchors.rightMargin: UI.DEFAULT_MARGIN

        color: UI.COLOR_INVERTED_SECONDARY_FOREGROUND
        font.pixelSize: UI.FONT_DEFAULT_SIZE
    }

    Binding {
        property: "leftMargin"
        target: root.item.anchors
        value: root.__valueX
    }

    onItemChanged: {
        item.parent = root;
        item.anchors.top = root.top;
        item.anchors.right = root.right;
        item.anchors.left = root.left;
        item.anchors.leftMargin = root.__valueX;
    }
}
