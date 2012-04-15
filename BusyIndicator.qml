import QtQuick 1.1
import com.nokia.meego 1.0

Item {
	id: indicator

	property alias running : rotation.running
	property Style platformStyle: BusyIndicatorStyle {}

	property int _leafCount: 12
	property real _rotation: 360 / _leafCount

    implicitWidth: platformStyle.size === "small" ? 32 : platformStyle.size === "medium" ? 64 : 128;
	implicitHeight: implicitWidth

	Image {
		id: spinner
		source: "images/busy_indicator_" + indicator.implicitWidth + (platformStyle.inverted ? "_inverted" : "") + ".png"
		smooth: true
	}

	Timer {
		id: rotation
		interval: platformStyle.period / _leafCount
		running: true
		repeat: true
		onTriggered: {
			spinner.rotation = spinner.rotation + _rotation;
		}
	}
}
