import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: delegate
    width: parent.width
    height: row.height

    property color color: available ? "black" : "red"

    Rectangle {
        id: hover
        anchors.fill: parent
        color: theme.hoverColor
        visible: mouseArea.containsMouse
    }

    Rectangle {
        id: highlight
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: theme.highlightGradientStart }
            GradientStop { position: 1.0; color: theme.highlightGradientEnd }
        }
        visible: mouseArea.pressed
    }

    RowLayout {
        id: row
        anchors { left: parent.left; right: parent.right; margins: 10 }
        height: hostLabel.height+10
        spacing: 10

        Image {
            width: height
            height: hostLabel.height
            sourceSize.width: width
            sourceSize.height: width
            fillMode: Image.PreserveAspectFit
            source: iconurl
        }

        Label {
            id: hostLabel
            anchors { verticalCenter: parent.verticalCenter }
            text: host
            width: 150
            Layout.preferredWidth: width
            elide: Text.ElideRight
            color: delegate.color
        }

        Label {
            anchors { verticalCenter: parent.verticalCenter }
            text: friendlyname
            width: 200
            Layout.preferredWidth: width
            elide: Text.ElideRight
            color: delegate.color
        }

        Label {
            anchors { verticalCenter: parent.verticalCenter }
            text: "UPNP %1".arg(version)
            width: 100
            Layout.preferredWidth: width
            elide: Text.ElideRight
            color: delegate.color
        }

        Label {
            anchors { verticalCenter: parent.verticalCenter }
            text: devicetype
            Layout.fillWidth: true
            elide: Text.ElideRight
            color: delegate.color
        }
    }

    Rectangle {
        id: separatorBottom
        width: parent.width
        height: 1
        anchors { left: parent.left; bottom: parent.bottom }
        color: theme.separatorColor
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            delegate.ListView.view.selectDetails(index, iconurl)
        }
    }
}
