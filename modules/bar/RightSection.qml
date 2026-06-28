import "../../components/widgets"
import QtQuick

Item {
    anchors {
        top: parent.top
        bottom: parent.bottom
        right: parent.right
    }

    width: clock.implicitWidth

    ClockWidget {
        id: clock
        anchors.centerIn: parent
    }
}