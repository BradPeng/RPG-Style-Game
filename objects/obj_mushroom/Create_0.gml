/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

enemy_script[ENEMYSTATE.CHASE] = hostile_mob_basic_chase;
state = ENEMYSTATE.CHASE;
idle_sprite = spr_mushroom_idle;
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
