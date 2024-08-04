function screen_shake(_magnitude, _frames){
	with (global.iCamera) {
		if (_magnitude > shake_remain) {
			shakeMagnitude = _magnitude;
			shake_remain = shakeMagnitude; 
			shakeLength = _frames;
		}
	}
}