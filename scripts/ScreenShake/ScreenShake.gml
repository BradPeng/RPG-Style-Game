function screen_shake(_magnitude, _frames){
	with (global.i_camera) {
		if (_magnitude > shake_remain) {
			shake_magnitude = _magnitude;
			shake_remain = shake_magnitude; 
			shake_length = _frames;
		}
	}
}