/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

sprAttack = s_slime_attack;
sprDie = s_slime_die;
sprHurt = s_slime_hurt;
sprMove = s_slime;
sprHitbox = s_slime_attack_hb
enemyScript[ENEMYSTATE.WANDER] = SlimeWander
enemyScript[ENEMYSTATE.CHASE] = SlimeChase
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie

entityDropList = choose(
	[o_coin],
	[o_coin, o_coin],
	[o_coin, o_coin, o_coin],
	[o_bomb_drop],
	[o_bomb_drop, o_coin],
);