/// @description Insert description here
// You can write your code in this editor
var _entity = instance_place(x, y, p_entity);
if (_entity != noone) {
	if (place_meeting(x, y,obj_blood_aura)) {
		dmg = dmg * global.player_blood_aura_level 	
	}
	with (_entity) {
		
		// damage enemy
		if (object_is_ancestor(object_index, p_hostile_mob)) {
			hurt_enemy(_entity, other.dmg, other.id, 5);
		} else if (entity_hit_script != -1) {
			script_execute(entity_hit_script);
		}
	}
}

instance_create_layer(x, y, "Instances", obj_explosion);
instance_destroy();
