import QtQuick 2.1
import QtQuick.Controls 1.0 as Controls

Controls.Action {
    id: action

    property bool pressed

    default property QtObject data

    ///change checked behaviour
    //property bool checked

    //onTriggered: {
    //    if (checkable)
    //        checked = !checked;
    //}
}

