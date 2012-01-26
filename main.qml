import "components"
import QtQuick 1.1
import com.nokia.meego 1.0

PageTileWindow {
	id: appWindow

	initialPage: mainPage

	MainPage {
		id: mainPage
	}

	AnotherPage {
		id: anotherPage
		Label {
			id: foo
			color: "gray"
			font.pointSize: 18
			anchors.centerIn: parent
			text: "Another Page"
		}

	}

	ToolBarLayout {
		id: commonTools
		visible: true

		TileRow {

			pageStack: appWindow.pageStack

			anchors.fill: parent
			anchors.margins: 10
			spacing: 18

			TileIcon {
				id: audioIcon
				iconSource: checked ? "images/tab_audio_down.png" :
									  "images/tab_audio_up.png"
				text: "Audio files"
				badge: "42"
				checkable: true
				page: mainPage
			}
			TileIcon {
				iconSource: checked ? "images/tab_profile_down.png" :
									  "images/tab_profile_up.png"
				text: "Profiles"
				badge: "7"
				checkable: true
				page: anotherPage
			}
		}
	}
}
