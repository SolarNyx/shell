import "../../components/widgets"
import QtQuick

Item {
    anchors {
        top: parent.top
        bottom: parent.bottom
        left: parent.left
    }

    width: workspace.implicitWidth

    WorkspaceWidget {
        id: workspace
        anchors.centerIn: parent
    }
}