import QtQuick 1.1
import com.nokia.meego 1.0

ToolBar {
	id: tile

	platformStyle: ToolBarStyle {
		inverted: true
        //background: "images/bar.png"
        background: "image://theme/meegotouch-toolbar-portrait-inverted-background"
	}
	transition: "replace"
}
