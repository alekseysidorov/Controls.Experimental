import "components"
import QtQuick 1.1
import com.nokia.meego 1.0

PageTileWindow {
	id: appWindow

	initialPage: mainPage

	MainPage {
		id: mainPage

		ButtonRow {
			anchors.fill: parent
		}
	}

	ToolBarLayout {
		id: commonTools
		visible: true

		ButtonRow {
			anchors.fill: parent
			anchors.margins: 10
			spacing: 18

			TileIcon {
				iconSource: checked ? "images/tab_audio_down.png" :
									  "images/tab_audio_up.png"
				text: "Audio files"
				checkable: true
			}
			TileIcon {
				iconSource: checked ? "images/tab_profile_down.png" :
									  "images/tab_profile_up.png"
				text: "Profiles"
				checkable: true
			}
		}
	}
}
