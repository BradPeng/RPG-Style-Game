/// @description Hit stuff
var _entity = instance_place(x, y, obj_p_entity);
var _break = false;
if (_entity != noone) {
	with (_entity) {
		
		// damage enemy
		if (object_is_ancestor(object_index, obj_p_hostile_mob)) {
			hurt_enemy(_entity, other.damage, other.id, other.knockback);
			_break = true;
		} else if (entity_hit_script != -1) {
			
			// force cast entity_hit_script to a script
			var _entity_hit_script_script = blank_script
			_entity_hit_script_script = entity_hit_script
			script_execute(_entity_hit_script_script);
			_break = true; // only break if we hit something
		}
	}
	
	if (_break) instance_destroy();
}

// destroy if we leave camera
var _cam = view_camera[0];
var _cam_x = camera_get_view_x(_cam);
var _cam_y = camera_get_view_y(_cam);
if (!point_in_rectangle(x, y, _cam_x, _cam_y, _cam_x + camera_get_view_width(_cam), _cam_y + camera_get_view_height(_cam))) {
	instance_destroy();	
}