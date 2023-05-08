/// Update to player's current position
cam = view_camera[0];
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
if (instance_exists(o_player)) {
	x = o_player.x
	y = o_player.y;
}