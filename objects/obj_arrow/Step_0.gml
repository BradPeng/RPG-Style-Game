/// @description Hit stuff
var _entity = instance_place(x, y, p_entity);
var _break = false;
if (_entity != noone) {
	with (_entity) {
		
		// damage enemy
		if (object_is_ancestor(object_index, p_hostile_mob)) {
			hurt_enemy(_entity, 25, other.id, 20);
			_break = true;
		} else if (entity_hit_script != -1) {
			script_execute(entity_hit_script);
			_break = true; // only break if we hit something
		}
	}
	
	if (_break) instance_destroy();
}

// destroy if we leave camera
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if (!point_in_rectangle(x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height(_cam))) {
	instance_destroy();	
}