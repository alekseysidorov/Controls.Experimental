import QtQuick 1.1
import com.nokia.meego 1.0

ButtonRow {
	id: root

	property QtObject pageStack: null

	onCheckedButtonChanged: {
		pageStack.push(checkedButton.page);
	}
}
