import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

RowLayout {
    id: root

    required property var screen

    spacing: 6

    property var hyprMonitor: Hyprland.monitorFor(root.screen)

    property var monitorWorkspaces: Hyprland.workspaces.values
        .filter(workspace => {
        if (root.hyprMonitor === null || root.hyprMonitor === undefined)
            return false

        return workspace.monitor !== null
            && workspace.monitor !== undefined
            && workspace.monitor.name === root.hyprMonitor.name
    })
        .sort((a, b) => a.id - b.id)

    Repeater {
        model: root.monitorWorkspaces

        Rectangle {
            required property var modelData

            width: 24
            height: 20
            radius: 6

            color: Hyprland.focusedWorkspace !== null
                && Hyprland.focusedWorkspace.id === modelData.id
                ? "#89b4fa"
                : "#313244"

            border.width: 1
            border.color: "#45475a"

            Text {
                anchors.centerIn: parent
                text: modelData.name
                color: "#cdd6f4"
                font.pixelSize: 12
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    Hyprland.dispatch(`hl.dsp.focus({ workspace = "${modelData.id.toString()}" })`)

                }
            }
        }
    }
}