event_inherited()
if (alarm[1] == 0) {
	image_xscale = 1;
	image_xscale = 1;
} else if (image_xscale < 1) {
	var _scale_speed = 0.05
	image_xscale = clamp(image_xscale, image_xscale + _scale_speed, 1)	
	image_yscale = clamp(image_yscale, image_yscale + _scale_speed, 1)	
}
