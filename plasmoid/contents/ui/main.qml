import QtQuick 2.11
import QtQuick.Layouts 1.11
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore

import "components"

Item {
	id: root
	property int    updateInterval: plasmoid.configuration.updateInterval
	property int    barHeight:      plasmoid.configuration.barHeight
	property int    barSpacing:     plasmoid.configuration.barSpacing
	property string barColor:       plasmoid.configuration.barColor
	property string fadeColor:      plasmoid.configuration.fadeColor

	Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
	Layout.maximumHeight: view.height
	Layout.fillWidth: true

	ListView {
		id: view
		width: parent.width
		height: contentHeight
		model: cpuModel
		spacing: root.barSpacing
		delegate: Heatbar {
			width: parent.width
			height: root.barHeight
			value: model.value
			barColor: root.barColor
			fadeColor: root.fadeColor
		}
	}

	ListModel {
		id: cpuModel
	}

	PlasmaCore.DataSource {
		engine: "systemmonitor"
		interval: root.updateInterval
		onSourceAdded: {
			let match = source.match(/^cpu\/cpu([0-9]+)\/TotalLoad/)
			if (match) {
				connectSource(source)
				cpuModel.append({ value: 0 })
			}
		}
		onNewData: {
			if (data.value) {
				let i = parseInt(data.name.split(" ")[1], 10) - 1
				let v = parseFloat(data.value, 10) / 100 // TODO: why is data.value a string?
				v = v + (Math.random() * 0.0001) // TODO: can haz on<Property>Set ?
				cpuModel.setProperty(i, "value", v)
			}
		}
	}
}
