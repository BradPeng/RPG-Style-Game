/// @description Insert description here
// You can write your code in this editor
animate_cardinal_sprite()
if (sourceObject != -1) {
	if (instance_exists(sourceObject) and sourceObject.state = ENEMYSTATE.ATTACK) {
		x = sourceObject.x
		y = sourceObject.y
	} else {
		instance_destroy()		
	}
}

var _entity = instance_place(x, y, obj_cast_shield);
if (_entity != noone) {
	_entity.hp -= sourceDamage
}

if (animationEnd) {
	instance_destroy()	
}

