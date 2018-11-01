import QtQuick 2.11

Canvas {
	property double value: 0.5
	property color barColor: Qt.hsla(0.3, 1, 0.3, 0.5)
	property color fadeColor: Qt.hsla(0,   1,   0, 0.15)

	onValueChanged: {
		var ctx = getContext("2d"); // TODO: move to init
		ctx.fillStyle = this.fadeColor;
		ctx.fillRect(0, 0, this.width, this.height);
		ctx.fillStyle = this.barColor;
		ctx.fillRect(0, 0, this.width * this.value, this.height);
		this.requestPaint();
	}
}
