/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

attack_sprite = spr_slime_attack;
sprDie = spr_slime_die;
sprHurt = spr_slime_hurt;
move_sprite = spr_slime;
hitbox_sprite = spr_slime_attack_hb
enemyScript[ENEMYSTATE.WANDER] = SlimeWander
enemyScript[ENEMYSTATE.CHASE] = SlimeChase
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie

entityDropList = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
);