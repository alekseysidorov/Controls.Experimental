import QtQuick 2.0
import QtQuick.Window 2.1

Item {
    readonly property real mm: Math.max(4, Screen.logicalPixelDensity)
    readonly property int gridUnit: Math.round(mm)

    function gu(f) {
        return f * gridUnit;
    }
}
