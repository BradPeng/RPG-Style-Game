/// @description Insert description here
// You can write your code in this editor
if (!global.gamePaused) {
	image_speed = 1
	
	if (image_index < 4) {
		var _entityList = ds_list_create();
		var _entityCount = instance_place_list(x, y, p_entity, _entityList, false);
		var _entity = noone;
		
		while (_entityCount > 0) {
			_entity = _entityList[| 0];
			if (ds_list_find_index(collisionHistory, _entity) == -1) { // if we haven't hit this thing already
				with (_entity) {
					if (object_is_ancestor(object_index, p_hostile_mob)) { // if enemy
						hurt_enemy(id, 25, other.id, 20);
					} else { // if entity
						if (entityHitScript != -1) {
							script_execute(entityHitScript);	
						}
					}
				}
				ds_list_add(collisionHistory, _entity);
			}
			ds_list_delete(_entityList, 0);
			_entityCount--;
		}
		ds_list_destroy(_entityList);
	}
} else {
	image_speed = 0;	
}