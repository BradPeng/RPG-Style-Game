/// @description Insert description here
// You can write your code in this editor


var _entity = instance_place(x, y, obj_player);
if (_entity != noone) {
	with (_entity) {
		//var projectileDirection = point_direction(other.x, other.y, other.x_to, other.y_to);
		hurt_player(other.direction, other.force, other.damage_to_player);
	}
}
instance_destroy()