/// @description Insert description here
// You can write your code in this editor
if (image_index >= 8 and image_index <= 12) {
	var _entity = instance_place(x, y, p_entity);
	if (_entity != noone) {
		if (place_meeting(x, y,obj_blood_aura)) {
			dmg = dmg * global.player_blood_aura_level 	
		}
		with (_entity) {
		
			// damage enemy
			if (object_is_ancestor(object_index, p_hostile_mob)) {
				HurtEnemy(_entity, 50, other.id, 0);
			} else if (entityHitScript != -1) {
				script_execute(entityHitScript);
			}
		}
	}
}