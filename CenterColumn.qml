import QtQuick 2.14

Column {
    Component.onCompleted: {
        // center align items horizontally
        for (var i = 0, count = children.length; i < count; i++) {
            var item = children[i]
            item.anchors.horizontalCenter = item.parent.horizontalCenter
        }
    }
}
