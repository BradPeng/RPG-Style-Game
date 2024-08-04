/// @description Insert description here
// You can write your code in this editor


var _entity = instance_place(x, y, obj_player);
if (_entity != noone) {
	with (_entity) {
		//var projectileDirection = point_direction(other.x, other.y, other.xTo, other.yTo);
		HurtPlayer(other.direction, other.force, other.damageToPlayer);
	}
}
instance_destroy()