if (type == TRANS_TYPE.SLIDE) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, percentage * height_half, false);
	draw_rectangle(0, height, width, height - percentage * height_half, false);
}

if (type == TRANS_TYPE.FADE) {
	
}