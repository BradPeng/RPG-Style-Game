var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
if (!point_in_rectangle(x, y, _cam_x, _cam_y, _cam_x + camera_get_view_width(_cam), _cam_y + camera_get_view_height(_cam))) {
	instance_destroy();	
}