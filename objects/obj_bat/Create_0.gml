/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

attack_sprite = spr_bat;
die_sprite = spr_bat_die;
hurt_sprite = spr_bat_hurt;
move_sprite = spr_bat;

enemy_script[ENEMYSTATE.WANDER] = bat_wander
enemy_script[ENEMYSTATE.CHASE] = bat_chase
enemy_script[ENEMYSTATE.ATTACK] = -1
enemy_script[ENEMYSTATE.HURT] = slime_hurt
enemy_script[ENEMYSTATE.DIE] = slime_die

entity_drop_list = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
);