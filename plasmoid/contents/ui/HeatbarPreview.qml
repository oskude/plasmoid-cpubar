import QtQuick 2.11

Item {
	property alias barColor: heatbar.barColor
	property alias fadeColor: heatbar.fadeColor

	Heatbar {
		anchors.fill: parent
		id: heatbar
	}

	onBarColorChanged: previewDataFiller.restart();
	onFadeColorChanged: previewDataFiller.restart();
	Component.onCompleted: previewDataFiller.start();

	// TODO: workaround to hope Canvas can getContext now...
	Timer {
		id: previewDataFiller
		interval: 1; repeat: false;
		onTriggered: {
			for (var i = 10; i > 0; i--) {
				heatbar.value = i * 0.1;
			}
		}
	}
}
