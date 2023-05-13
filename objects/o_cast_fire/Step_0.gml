
var _entity = instance_place(x, y, p_entity);
if (_entity != noone) {
	if (place_meeting(x, y,o_blood_aura)) {
		dmg = dmg * global.playerBloodAuraLevelMax 	
	}
	with (_entity) {
		
		// damage enemy
		if (object_is_ancestor(object_index, p_hostile_mob)) {
			HurtEnemy(_entity, other.dmg, other.id, 50);
		} else if (entityHitScript != -1) {
			script_execute(entityHitScript);
		}
	}
	
}
