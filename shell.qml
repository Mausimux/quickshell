import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
	anchors {
		top: true
		right: true
	}

	implicitHeight: clock.implicitHeight
	implicitWidth: clock.implicitWidth

	Text {
		id: clock
		anchors.centerIn: parent

		Process {
			id: dateProc
			command: ["date"]
			running: true
			stdout: StdioCollector {
				onStreamFinished: clock.text = this.text
			}
		}

		Timer {
			interval: 1000
			running: true
			repeat: true
			onTriggered: dateProc.running = true
		}
	}
}
