/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.WANDER;

attack_sprite = spr_slime_attack;
die_sprite = spr_slime_die;
hurt_sprite = spr_slime_hurt;
move_sprite = spr_slime;
hitbox_sprite = spr_slime_attack_hb
enemy_script[ENEMYSTATE.WANDER] = slime_wander
enemy_script[ENEMYSTATE.CHASE] = slime_chase
enemy_script[ENEMYSTATE.ATTACK] = slime_attack
enemy_script[ENEMYSTATE.HURT] = slime_hurt
enemy_script[ENEMYSTATE.DIE] = slime_die

entity_drop_list = choose(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_bomb_drop, obj_coin],
);