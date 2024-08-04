// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calc_attack(_hb, _dmg, _knockback){
	mask_index = _hb
	var _hit_by_attack_now = ds_list_create();
	var _hits = instance_place_list(x, y, p_entity, _hit_by_attack_now, false); //returns list of entities in the collision
	
	if (_hits > 0) {
		for (var _i = 0; _i < _hits; _i++) {
			// if instance not yet hit, hit it
			var _hit_id = ds_list_find_value(_hit_by_attack_now, _i);
			if (ds_list_find_index(hit_by_attack_list, _hit_id) == -1) { // if the instance we are checking is not already in the hit list
				ds_list_add(hit_by_attack_list, _hit_id);
				
				with (_hit_id) {
					
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
	ds_list_destroy(_hit_by_attack_now);
	mask_index = spr_player;
}