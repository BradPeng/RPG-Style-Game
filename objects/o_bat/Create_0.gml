/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

sprAttack = s_bat;
sprDie = s_bat_die;
sprHurt = s_bat_hurt;
sprMove = s_bat;

enemyScript[ENEMYSTATE.WANDER] = BatWander
enemyScript[ENEMYSTATE.CHASE] = BatChase
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