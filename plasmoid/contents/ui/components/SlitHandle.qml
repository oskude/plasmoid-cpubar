import QtQuick 2.11

Canvas {
	property string fillColor: "#f6f6f6"
	property string borderColor: "#bdbebf"

	x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
	y: parent.topPadding + parent.availableHeight / 2 - height / 2
	implicitWidth: 26
	implicitHeight: 26
	onPaint: {
		let x = this.width / 2;
		let y = this.height / 2;
		let p = this.height * 0.2;
		let ctx = getContext("2d");
		ctx.fillStyle = fillColor;
		ctx.strokeStyle = borderColor;
		ctx.beginPath();
		ctx.arc(x, y, y-0.5, 0, 2 * Math.PI);
		ctx.fill();
		ctx.stroke();
		ctx.clearRect(x-0.5, p, 1, this.height-(p*2));
	}
}
