/// @description Insert description here
// You can write your code in this editor
if (!global.game_paused) {
	image_speed = 1
	
	if (image_index < 4) {
		var _entity_list = ds_list_create();
		var _entity_count = instance_place_list(x, y, obj_p_entity, _entity_list, false);
		var _entity = noone;
		
		while (_entity_count > 0) {
			_entity = _entity_list[| 0];
			if (ds_list_find_index(collision_history, _entity) == -1) { // if we haven't hit this thing already
				with (_entity) {
					if (object_is_ancestor(object_index, obj_p_hostile_mob)) { // if enemy
						hurt_enemy(id, 25, other.id, 20);
					} else { // if entity
						if (entity_hit_script != -1) {
							script_execute(entity_hit_script);	
						}
					}
				}
				ds_list_add(collision_history, _entity);
			}
			ds_list_delete(_entity_list, 0);
			_entity_count--;
		}
		ds_list_destroy(_entity_list);
	}
} else {
	image_speed = 0;	
}