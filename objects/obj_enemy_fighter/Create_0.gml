/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
move_sprite = spr_enemy1_walk;
idle_sprite = spr_enemy1_idle;
attack_sprite = spr_player_attack_slash
sprHurt = spr_enemy1_hurt;
sprDie = spr_player_die;
hitbox_sprite = spr_player_attac_slash_hb
state = ENEMYSTATE.WANDER
enemyScript[ENEMYSTATE.DIE] = SlimeDie