import QtQuick 1.1
import com.nokia.meego 1.0
import "UIConstants.js" as UI

Item {
	property alias text: label.text

	height: label.paintedHeight * 1.5
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

		font.pixelSize: UI.FONT_LARGE
		color: UI.COLOR_INVERTED_FOREGROUND
		text: "Title"
	}

	Rectangle {
		id: hr

		width: parent.width
		height: 1
		anchors.bottom: parent.bottom
		color: UI.COLOR_INVERTED_SECONDARY_FOREGROUND

	}
}

