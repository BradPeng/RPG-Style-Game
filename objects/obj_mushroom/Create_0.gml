/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.CHASE;

attack_sprite = spr_mushroom_walk;
die_sprite = spr_mushroom_walk;
hurt_sprite = spr_mushroom_walk;
move_sprite = spr_mushroom_walk;


entity_drop_list = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
);
