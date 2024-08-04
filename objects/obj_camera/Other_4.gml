/// Update to player's current position
cam = view_camera[0];
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
if (instance_exists(obj_player)) {
	x = obj_player.x
	y = obj_player.y;
}