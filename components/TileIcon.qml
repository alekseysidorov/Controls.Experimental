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
	property QtObject page: null

	signal clicked

	function alert() {
		console.log("alert");
		state = "alert";
	}

	width: childrenRect.width
	height: childrenRect.height
	transformOrigin: Item.Bottom

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

	Timer {
		id: alertTimer
		interval: 250
		running: false
		onTriggered: {
			console.log("change state");
			root.state = "";
		}
	}

	states: [
		// Inactive state.
		State {
			name: "pressed"
			when: root.pressed
			PropertyChanges { target: root; scale: 2.5; }
		},
		State {
			name: "alert"
			PropertyChanges {
				target: alertTimer
				running: true
			}
			PropertyChanges {
				target: root
				transformOrigin: Item.Center
				scale: 1.5
			}
		},
		State {
			name: ""
			PropertyChanges {
				target: root
				rotation: 0
				scale: 1
			}
		}

	]

	transitions: [
		// Transition between active and inactive states.
		Transition {
			from: ""; to: "pressed"; reversible: true
			ParallelAnimation {
				PropertyAnimation { properties: "scale"; easing.type: Easing.InOutExpo; duration: 150 }
			}
		},
		Transition {
			from: ""
			to: "alert"
			reversible: true

			SequentialAnimation {
				running: true
				loops: 5

				RotationAnimation {
					target: root
					properties: "rotation"
					from: 0
					to: 10
					duration: 25
				}
				RotationAnimation {
					target: root
					properties: "rotation"
					from: 10
					to: -10
					duration: 50
				}
				RotationAnimation {
					target: root
					properties: "rotation"
					from: -10
					to: 0
					duration: 25
				}
			}
			ParallelAnimation {
				PropertyAnimation { properties: "scale"; easing.type: Easing.InOutExpo; duration: 150 }
			}
		}
	]
}
