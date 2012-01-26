import QtQuick 1.1
import com.nokia.meego 1.0

Item {
	id: root

	property bool checked: false
	property bool checkable: false
	property alias pressed: mouseArea.pressed

	property alias iconSource : icon.source
	property alias text: label.text
	property alias badge: badgeLabel.text
	property int progress: 0
	property QtObject page: null
	property bool blinking: false

	property Style platformStyle: TileIconStyle {}

	signal clicked

	function alert() {
		alertTimer.restart();
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
		color: checked ? platformStyle.selectedTextColor : platformStyle.textColor

		anchors.top: icon.bottom
		//anchors.topMargin: label.paintedHeight / 2
		//anchors.horizontalCenter: root.horizontalCenter

		elide: Text.ElideMiddle
		horizontalAlignment: Text.AlignHCenter
		font.pointSize: 12
	}

	BorderImage {
		id: badgeBackground
		source: platformStyle.badgeBackground
		visible: badge.length > 0
		smooth: true

		anchors.right: label.right
		anchors.top: root.top

		width: Math.max(badgeBackground.sourceSize.width, badgeLabel.implicitWidth + badgeLabel.font.pointSize)
		height: Math.max(badgeBackground.sourceSize.height, badgeLabel.implicitHeight + badgeLabel.font.pointSize)
		border.left: 10; border.top: 10
		border.right: 10; border.bottom: 10

		Text {
			id: badgeLabel
			font.pointSize: 10
			anchors.centerIn: parent

			color: "white"
		}
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
		interval: 1000
		running: false
		onRunningChanged: {
			root.state = running ? "blinking" : "";
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
			name: "blinking"
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
			to: "blinking"

			SequentialAnimation {
				loops: RotationAnimation.Infinite

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
			PropertyAnimation { properties: "scale"; easing.type: Easing.InOutExpo; duration: 150 }
		},
		Transition {
			from: "blinking"
			to: ""

			PropertyAnimation {
				target: root
				properties: "rotation, scale"
				duration: 150
			}

		}
	]
}
