if (type == TRANS_TYPE.SLIDE) {
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, percentage * heightHalf, false);
	draw_rectangle(0, height, width, height - percentage * heightHalf, false);
}

if (type == TRANS_TYPE.FADE) {
	
}