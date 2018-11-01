import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.0

Item {
	id: root
	property int cfg_updateInterval
	property int cfg_barHeight
	property int cfg_barSpacing
	property color cfg_barColor
	property color cfg_fadeColor

	GridLayout {
		columns: 2

		// color picker for bar colors
		HeatbarPreview {
			Layout.columnSpan: 2
			Layout.fillWidth: true
			Layout.preferredHeight: 16
			barColor: cfg_barColor
			fadeColor: cfg_fadeColor
			MouseArea { // left
				anchors.left: parent.left
				anchors.right: parent.horizontalCenter
				height: parent.height
				onClicked: {
					barColorPicker.open();
				}
				ColorDialog {
					id: barColorPicker
					title: "Bar Color"
					color: root.cfg_barColor
					showAlphaChannel: true
					onAccepted: root.cfg_barColor = this.color
				}
			}
			MouseArea { // right
				anchors.left: parent.horizontalCenter
				anchors.right: parent.right
				height: parent.height
				onClicked: {
					fadeColorPicker.open();
				}
				ColorDialog {
					id: fadeColorPicker
					title: "Fade Color"
					color: root.cfg_fadeColor
					showAlphaChannel: true
					onAccepted: root.cfg_fadeColor = this.color
				}
			}
		}

		Label {
			text: i18n("Update Interval:")
		}
		SpinBox {
			decimals: 0
			stepSize: 50
			maximumValue: 10000
			suffix: i18nc("Suffix for spinbox (milliseconds)", " msec")
			onValueChanged: cfg_updateInterval = value
			Component.onCompleted: value = cfg_updateInterval
		}

		Label {
			text: i18n("Bar Height:")
		}
		SpinBox {
			decimals: 0
			stepSize: 1
			maximumValue: 1000
			suffix: i18nc("Suffix for spinbox (pixels)", " pixel")
			onValueChanged: cfg_barHeight = value
			Component.onCompleted: value = cfg_barHeight
		}

		Label {
			text: i18n("Bar Spacing:")
		}
		SpinBox {
			decimals: 0
			stepSize: 1
			maximumValue: 1000
			suffix: i18nc("Suffix for spinbox (pixels)", " pixel")
			onValueChanged: cfg_barSpacing = value
			Component.onCompleted: value = cfg_barSpacing
		}
	}
}
