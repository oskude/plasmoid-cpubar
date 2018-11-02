import QtQuick 2.11
import QtQuick.Controls 2.4 as QtControl2
import QtGraphicalEffects 1.0 as QtEffect

QtControl2.Slider {
	id: root
	property double hueValue: 0
	property double satValue: 1
	property double litValue: 0.5
	property int boxSize: 9
	property alias border: borderItem.border
	property alias fillColor: handleItem.fillColor
	property alias borderColor: handleItem.borderColor

	width: parent.width
	height: 26 // TODO: how do we want to set this height?

	background: Item {
		anchors.fill: parent
		anchors.leftMargin: parent.leftPadding + handleItem.width / 2
		anchors.rightMargin: parent.rightPadding + handleItem.width / 2
		anchors.topMargin: parent.topPadding
		anchors.bottomMargin: parent.bottomPadding
		Rectangle {
			id: borderItem
			anchors.centerIn: parent
			width: parent.width
			height: parent.height + (border.width * 2)
			color: "transparent"
		}
		AlphaBackground {
			boxSize: root.boxSize
		}
		QtEffect.LinearGradient {
			anchors.fill: parent
			start: Qt.point(0, 0)
			end: Qt.point(parent.width, 0)
			gradient: Gradient {
				GradientStop { position: 0; color: "transparent" }
				GradientStop { position: 1; color: Qt.hsla(hueValue, satValue, litValue, 1.0) }
			}
		}
	}
	handle: SlitHandle {
		id: handleItem
	}
}
