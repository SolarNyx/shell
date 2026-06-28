import "../../components/widgets"
import QtQuick

Item {
    required property var screen

    anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
    }

    width: workspace.implicitWidth

    WorkspaceWidget {
        id: workspace
        screen: parent.screen
        anchors.centerIn: parent
    }
}