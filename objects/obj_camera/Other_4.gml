/// Update to player's current position
cam = view_camera[0];
view_width_half = camera_get_view_width(cam) * 0.5;
view_height_half = camera_get_view_height(cam) * 0.5;
if (instance_exists(obj_player)) {
	x = obj_player.x
	y = obj_player.y;
}