import QtQuick 2.0

QtObject {
    readonly property real mm: 4
    readonly property int gridUnit: mm

    function gu(f) {
        return f * gridUnit;
    }
}
