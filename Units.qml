pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.1

Item {
    property real gridUnit: {
        if (Qt.platform.os === "android")
            return 8;
        return 4;
    }

    function gu(f) {
        return f * gridUnit;
    }
}
