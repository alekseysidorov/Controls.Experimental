import QtQuick 1.1
import com.nokia.meego 1.0

Item {
	id: root

	property bool checked: false
	property bool checkable: false
	property alias pressed: mouseArea.pressed

	property alias iconSource : icon.source
	property alias text: label.text
	property string badge
	property int progress: 0

	signal clicked

	width: childrenRect.width
	height: childrenRect.height


	Image {
		id: icon
		smooth: true

		anchors.horizontalCenter: label.horizontalCenter
	}

	Text {
		id: label
		color: checked ? "white" : "gray"

		anchors.top: icon.bottom
		//anchors.topMargin: label.paintedHeight / 2
		anchors.horizontalCenter: root.horizontalCenter

		elide: Text.ElideMiddle
		horizontalAlignment: Text.AlignHCenter
		font.pointSize: 12
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		onClicked: {
			if (root.checkable)
				root.checked = !root.checked;
			root.clicked();
		}
	}

	states: [
		// Inactive state.
		State {
			name: "pressed"
			when: root.pressed
			PropertyChanges { target: root; scale: 1.5; }
		}
	]

	transitions: [
		// Transition between active and inactive states.
		Transition {
			from: ""; to: "pressed"; reversible: true
			ParallelAnimation {
				PropertyAnimation { properties: "scale"; easing.type: Easing.InOutExpo; duration: 150 }
			}
		}
	]
}
