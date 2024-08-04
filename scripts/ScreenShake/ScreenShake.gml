function ScreenShake(_magnitude, _frames){
	with (global.iCamera) {
		if (_magnitude > shakeRemain) {
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude; 
			shakeLength = _frames;
		}
	}
}