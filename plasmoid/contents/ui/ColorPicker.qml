import QtQuick 2.11
import QtQuick.Layouts 1.11

import "components"

Item {
	id: root
	width: parent.width

	property double hueValue: 0
	property double satValue: 0
	property double litValue: 0
	property double alfValue: 0
	property color selectedColor
	property color borderColor
	property color loadColor
	property color fillColor

	function rgbaToHsla(color){
		let r,g,b,a = 0;
		color = color.toString();
		if (color.length === 7) {
			r = parseInt(color.substr(1,2), 16) / 255;
			g = parseInt(color.substr(3,2), 16) / 255;
			b = parseInt(color.substr(5,2), 16) / 255;
		} else if (color.length === 9) {
			a = parseInt(color.substr(1,2), 16) / 255;
			r = parseInt(color.substr(3,2), 16) / 255;
			g = parseInt(color.substr(5,2), 16) / 255;
			b = parseInt(color.substr(7,2), 16) / 255;
		} else {
			// TODO: how to fail?
		}
		let max = Math.max(r, g, b), min = Math.min(r, g, b);
		let h, s, l = (max + min) / 2;

		if(max == min){
			h = s = 0; // achromatic
		}else{
			let d = max - min;
			s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
			switch(max){
				case r: h = (g - b) / d + (g < b ? 6 : 0); break;
				case g: h = (b - r) / d + 2; break;
				case b: h = (r - g) / d + 4; break;
			}
			h /= 6;
		}

		return [h, s, l, a];
	}

	function mixColor() {
		root.selectedColor = Qt.hsla(
			this.hueValue,
			this.satValue,
			this.litValue,
			this.alfValue
		);
	}

	onHueValueChanged: mixColor()
	onSatValueChanged: mixColor()
	onLitValueChanged: mixColor()
	onAlfValueChanged: mixColor()

	ColumnLayout {
		width: parent.width
		spacing: 16

		HueSlider {
			Layout.fillWidth: true
			onValueChanged: root.hueValue = this.value
			Component.onCompleted: this.value = root.hueValue
			border.color: root.borderColor
			border.width: 1
			fillColor: root.fillColor
			borderColor: root.borderColor
		}

		SatSlider {
			Layout.fillWidth: true
			hueValue: root.hueValue
			litValue: root.litValue
			onValueChanged: root.satValue = this.value
			Component.onCompleted: this.value = root.satValue
			border.color: root.borderColor
			border.width: 1
			fillColor: root.fillColor
			borderColor: root.borderColor
		}

		LitSlider {
			Layout.fillWidth: true
			hueValue: root.hueValue
			satValue: root.satValue
			onValueChanged: root.litValue = this.value
			Component.onCompleted: this.value = root.litValue
			border.color: root.borderColor
			border.width: 1
			fillColor: root.fillColor
			borderColor: root.borderColor
		}

		AlfSlider {
			Layout.fillWidth: true
			hueValue: root.hueValue
			satValue: root.satValue
			litValue: root.litValue
			onValueChanged: root.alfValue = this.value
			Component.onCompleted: this.value = root.alfValue
			border.color: root.borderColor
			border.width: 1
			fillColor: root.fillColor
			borderColor: root.borderColor
		}
	}

	Component.onCompleted: {
		let hsla = rgbaToHsla(root.loadColor);
		root.hueValue = hsla[0];
		root.satValue = hsla[1];
		root.litValue = hsla[2];
		root.alfValue = hsla[3];
		mixColor()
	}
}
