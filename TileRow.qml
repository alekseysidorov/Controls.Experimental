import QtQuick 1.1
import com.nokia.meego 1.0

ButtonRow {
	id: root

	property QtObject pageStack: null

    function __updateTile()
    {
        if (pageStack === "undefined")
            return;
        var length = children.length;
        for (var i = 0; i < length; i++) {
            var item = children[i];
            var page = item.page;
            if (page !== "undefined")
                item.checked = (page === pageStack.currentPage);
        }
    }

	onCheckedButtonChanged: {
		pageStack.push(checkedButton.page);
	}

    Connections {
        target: pageStack
        onCurrentPageChanged: __updateTile()
    }
}
