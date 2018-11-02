import QtQuick 2.11
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Controls 2.4 as Controls2
import QtQuick.Layouts 1.11
import QtQuick.Dialogs 1.3
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
	id: root
	width: childrenRect.width
	height: childrenRect.height

	property int cfg_updateInterval
	property int cfg_barHeight
	property int cfg_barSpacing
	property color cfg_barColor
	property color cfg_fadeColor

	GridLayout {
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.rightMargin: 10
		columns: 2

		HeatbarPreview {
			Layout.columnSpan: 2
			Layout.fillWidth: true
			Layout.preferredHeight: 20
			Layout.bottomMargin: 10
			barColor: cfg_barColor
			fadeColor: cfg_fadeColor
		}

		Controls2.TabBar {
			id: colorTab
			Layout.columnSpan: 2
			Layout.fillWidth: true
			Layout.bottomMargin: 8
			Controls2.TabButton {
				text: "Settings"
			}
			Controls2.TabButton {
				text: "Bar Color"
			}
			Controls2.TabButton {
				text: "Fade Color"
			}
		}

		StackLayout {
			Layout.columnSpan: 2
			Layout.fillWidth: true
			currentIndex: colorTab.currentIndex
			Item {
				GridLayout {
					columns: 2
					PlasmaComponents.Label {
						text: i18n("Update Interval:")
					}
					Controls1.SpinBox {
						decimals: 0
						stepSize: 50
						maximumValue: 10000
						suffix: i18nc("Suffix for spinbox (milliseconds)", " msec")
						onValueChanged: cfg_updateInterval = value
						Component.onCompleted: value = cfg_updateInterval
					}

					PlasmaComponents.Label {
						text: i18n("Bar Height:")
					}
					Controls1.SpinBox {
						decimals: 0
						stepSize: 1
						maximumValue: 1000
						suffix: i18nc("Suffix for spinbox (pixels)", " pixel")
						onValueChanged: cfg_barHeight = value
						Component.onCompleted: value = cfg_barHeight
					}

					PlasmaComponents.Label {
						text: i18n("Bar Spacing:")
					}
					Controls1.SpinBox {
						decimals: 0
						stepSize: 1
						maximumValue: 1000
						suffix: i18nc("Suffix for spinbox (pixels)", " pixel")
						onValueChanged: cfg_barSpacing = value
						Component.onCompleted: value = cfg_barSpacing
					}
				}
			}
			Item {
				ColorPicker {
					Layout.fillWidth: true
					Layout.fillHeight: true
					loadColor: cfg_barColor
					onSelectedColorChanged: {
						root.cfg_barColor = this.selectedColor;
					}
					fillColor: theme.buttonBackgroundColor
					borderColor: theme.buttonTextColor
				}
			}
			Item {
				ColorPicker {
					Layout.fillWidth: true
					Layout.fillHeight: true
					loadColor: cfg_fadeColor
					onSelectedColorChanged: {
						root.cfg_fadeColor = this.selectedColor;
					}
					fillColor: theme.buttonBackgroundColor
					borderColor: theme.buttonTextColor
				}
			}
		}
	}
}
