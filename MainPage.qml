import QtQuick 1.1
import com.nokia.meego 1.0

Page {

	Rectangle {
		anchors.fill: parent
		color: "white"

		Button {
			anchors.centerIn: parent
			text: "Click me"
			onClicked: audioIcon.alert();
		}
	}

    tools: commonTools
}
