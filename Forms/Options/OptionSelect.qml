import QtQuick 2.0
import QtQuick.Controls 1.1

import Controls.Forms 1.0

Option {
    id: control

    property string title
    property variant value
    property bool editable: false
    property QtObject validator
    property variant model
    property string textRole: ""
    property string valueRole: textRole

    signal accepted

    readonly property bool __modelIsArray: !!model ? model.constructor === Array : false;
    ///internal
    function __getValue(item) {
        if (typeof item === "object")
            item = item[valueRole];
        return item;
    }
    function __getEntry(index) {
        if (__modelIsArray)
            return model[index];
        var obj = model.get(index);
        return obj;
    }
    function __find(value) {
        var count = __modelIsArray ? model.length : model.count;
        for (var i = 0; i < count; ++i) {
            var entry = __getEntry(i);
            if (__getValue(entry) === value)
                return i;
        }
        return -1;
    }

    style: FormRow {
        title: control.title

        ComboBox {
            id: combobox

            onCurrentIndexChanged: {
                if (currentIndex !== -1)
                    control.value = control.__getValue(control.__getEntry(currentIndex));
            }
            onAccepted: {
                control.value = currentText;
                control.accepted();
            }

            model: control.model
            editable: control.editable
            validator: control.validator
            textRole: control.textRole
            currentIndex: control.__find(control.value)

            Connections {
                target: control
                onValueChanged: {
                    combobox.currentIndex = control.__find(value);
                }
            }
        }
    }
}
