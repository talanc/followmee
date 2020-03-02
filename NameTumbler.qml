import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.12

Item {
    property variant __characters: [ "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    function formatText(count, modelData, tumbler) {
        return modelData;
    }

    function getName() {
        return tumbler1.currentItem.text + tumbler2.currentItem.text + tumbler3.currentItem.text;
    }

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData, Tumbler.tumbler)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: fontMetrics.font.pixelSize * 1.25
        }
    }

    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent

        background: Rectangle {
            anchors.fill: parent
            color: Material.background
            opacity: 0.5
            border.color: "white"
        }

        Row {
            id: row

            Tumbler {
                id: tumbler1
                model: __characters
                delegate: delegateComponent
            }

            Tumbler {
                id: tumbler2
                model: __characters
                delegate: delegateComponent
            }

            Tumbler {
                id: tumbler3
                model: __characters
                delegate: delegateComponent
            }
        }
    }
}
