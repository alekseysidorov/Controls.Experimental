import QtQuick 1.1
import com.nokia.meego 1.0

Window {
	id: window

	property bool showStatusBar: true
	property bool showToolBar: true
	property variant initialPage
	property alias pageStack: stack

	StatusBar {
		id: statusBar
		anchors.top: parent.top
		width: parent.width
		showStatusBar: window.showStatusBar
	}

	Item {
		objectName: "appWindowContent"
		width: parent.width
		anchors.top: statusBar.bottom
		anchors.bottom: parent.bottom

		// content area
		Item {
			id: contentArea
			anchors { top: parent.top; left: parent.left; right: parent.right; bottom: parent.bottom; }
			anchors.bottomMargin: tileBar.visible || (tileBar.opacity==1)? tileBar.height : 0
			PageStack {
				id: stack
				anchors.fill: parent
				toolBar: tileBar
			}
		}

		TileBar {
			id: tileBar
			anchors.bottom: parent.bottom
			privateVisibility: (inputContext.softwareInputPanelVisible==true || inputContext.customSoftwareInputPanelVisible == true)
			? ToolBarVisibility.HiddenImmediately : (window.showToolBar ? ToolBarVisibility.Visible : ToolBarVisibility.Hidden)
		}
	}

	// event preventer when page transition is active
	MouseArea {
		anchors.fill: parent
		enabled: pageStack.busy
	}

	Component.onCompleted: {
		if (initialPage) pageStack.push(initialPage);
	}

	onOrientationChangeStarted: {
		statusBar.orientation = screen.currentOrientation
	}
}
