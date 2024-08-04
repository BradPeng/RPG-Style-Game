/// @description Insert description here
// You can write your code in this editor
if (image_index >= 8 and image_index <= 12) {
	var _entity = instance_place(x, y, obj_p_entity);
	if (_entity != noone) {
		if (place_meeting(x, y,obj_blood_aura)) {
			dmg = dmg * global.player_blood_aura_level 	
		}
		with (_entity) {
		
			// damage enemy
			if (object_is_ancestor(object_index, obj_p_hostile_mob)) {
				hurt_enemy(_entity, 50, other.id, 0);
			} else if (entity_hit_script != -1) {
				// force cast entity_hit_script to a script
				var _entity_hit_script_script = blank_script
				_entity_hit_script_script = entity_hit_script
				script_execute(_entity_hit_script_script);
			}
		}
	}
}