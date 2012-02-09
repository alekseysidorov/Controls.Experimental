import QtQuick 1.1
import com.nokia.meego 1.0
import "UIConstants.js" as UI

Item {
    id: root
    property alias text: label.text
    property real __bottomSpacing: screen.currentOrientation === Screen.Portrait ? UI.HEADER_DEFAULT_BOTTOM_SPACING_PORTRAIT :
                                                                                   UI.HEADER_DEFAULT_TOP_SPACING_LANDSCAPE
    property real __topSpacing: screen.currentOrientation === Screen.Portrait ? UI.HEADER_DEFAULT_TOP_SPACING_PORTRAIT :
                                                                                UI.HEADER_DEFAULT_TOP_SPACING_LANDSCAPE

    height: screen.currentOrientation === Screen.Portrait ? UI.HEADER_DEFAULT_HEIGHT_PORTRAIT :
                                                            UI.HEADER_DEFAULT_HEIGHT_LANDSCAPE
    z: 100;

    anchors.top: parent.top;
    anchors.left: parent.left
    anchors.right: parent.right

    anchors.leftMargin: UI.CORNER_MARGINS
    anchors.rightMargin: UI.CORNER_MARGINS
    anchors.topMargin: UI.CORNER_MARGINS

    //	gradient: Gradient {
    //		 GradientStop { position: 0.0; color: "#5878A1" }
    //		 GradientStop { position: 1.0; color: "#466392" }
    //	}

    Label {
        id: label

        anchors.top: root.top

        font.pixelSize: UI.FONT_XLARGE
        color: UI.COLOR_INVERTED_FOREGROUND
        text: "Title"
    }

    Rectangle {
        id: hr

        width: parent.width
        height: 1
        anchors.top: label.bottom
        anchors.topMargin: __topSpacing

        color: UI.COLOR_INVERTED_SECONDARY_FOREGROUND

    }
}

