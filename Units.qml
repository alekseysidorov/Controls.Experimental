import QtQuick 2.0
import QtQuick.Window 2.1

Item {
    readonly property real gridUnit: {
        if (Qt.platform.os === "android")
            return 8;
        return Math.max(4, Screen.logicalPixelDensity);
    }

    function gu(f) {
        return f * gridUnit;
    }
}
