import QtQuick 2.11

Canvas {
	property int boxSize

	anchors.fill: parent
	onPaint: {
		let ctx = getContext("2d");
		ctx.fillStyle = "#777";
		ctx.fillRect(0, 0, parent.width, parent.height);
		ctx.fillStyle = "#999";
		for (var y = 0; y < parent.height; y += boxSize) {
			let s = ((y / boxSize) % 2) * boxSize;
			for (var x = 0; x < parent.width; x += boxSize * 2) {
				ctx.fillRect(x + s, y, boxSize, boxSize);
			}
		}
	}
}
