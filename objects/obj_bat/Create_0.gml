/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

attack_sprite = spr_bat;
die_sprite = spr_bat_die;
hurt_sprite = spr_bat_hurt;
move_sprite = spr_bat;

enemyScript[ENEMYSTATE.WANDER] = bat_wander
enemyScript[ENEMYSTATE.CHASE] = bat_chase
enemyScript[ENEMYSTATE.ATTACK] = -1
enemyScript[ENEMYSTATE.HURT] = slime_hurt
enemyScript[ENEMYSTATE.DIE] = slime_die

entityDropList = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
);