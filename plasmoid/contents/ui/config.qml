import QtQuick 2.11
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.11

Item {
	property int cfg_updateInterval
	property int cfg_barHeight
	property int cfg_barSpacing
	
	GridLayout {
		columns: 2

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
