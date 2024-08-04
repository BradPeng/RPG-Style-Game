// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calc_attack(hb, _dmg, _knockback){
	mask_index = hb
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, p_entity, hitByAttackNow, false); //returns list of entities in the collision
	
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			// if instance not yet hit, hit it
			var hitID = ds_list_find_value(hitByAttackNow, i);
			if (ds_list_find_index(hitByAttackList, hitID) == -1) { // if the instance we are checking is not already in the hit list
				ds_list_add(hitByAttackList, hitID);
				
				with (hitID) {
					
					// if thing we hit is an enemy
					if (object_is_ancestor(object_index, p_hostile_mob)) {
						hurt_enemy(id, _dmg, other.id, _knockback);
					} else {
					
						// do something to the non enemy entity we hit
						if (entity_hit_script != -1) {
							script_execute(entity_hit_script);	
						}
					}
				}	
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_player;
}