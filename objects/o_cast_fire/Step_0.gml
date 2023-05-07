var _entity = instance_place(x, y, p_entity);
if (_entity != noone) {
	with (_entity) {
		
		// damage enemy
		if (object_is_ancestor(object_index, p_enemy)) {
			HurtEnemy(_entity, 1000, other.id, 50);
		} else if (entityHitScript != -1) {
			script_execute(entityHitScript);
		}
	}
	
}
