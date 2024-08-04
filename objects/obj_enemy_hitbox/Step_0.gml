/// @description Insert description here
// You can write your code in this editor
animate_cardinal_sprite()
if (source_object != -1) {
	if (instance_exists(source_object) and source_object.state = ENEMYSTATE.ATTACK) {
		x = source_object.x
		y = source_object.y
	} else {
		instance_destroy()		
	}
}

var _entity = instance_place(x, y, obj_cast_shield);
if (_entity != noone) {
	_entity.hp -= source_damage
}

if (animation_end) {
	instance_destroy()	
}

