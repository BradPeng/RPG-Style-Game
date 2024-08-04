/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

sprAttack = spr_bat;
sprDie = spr_bat_die;
sprHurt = spr_bat_hurt;
sprMove = spr_bat;

enemyScript[ENEMYSTATE.WANDER] = bat_wander
enemyScript[ENEMYSTATE.CHASE] = bat_chase
enemyScript[ENEMYSTATE.ATTACK] = -1
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie

entityDropList = choose(
	[o_coin],
	[o_coin, o_coin],
	[o_coin, o_coin, o_coin],
	[o_bomb_drop],
	[o_bomb_drop, o_coin],
);