/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
sprMove = s_player_run;
sprIdle = s_player;
sprAttack = s_player_attack_slash
sprHurt = s_player_hurt;
sprDie = s_player_die;
state = ENEMYSTATE.WANDER
enemyScript[ENEMYSTATE.WANDER] = EnemyFighterWander;
enemyScript[ENEMYSTATE.CHASE] = EnemyFighterChase
enemyScript[ENEMYSTATE.ATTACK] = EnemyFighterAttack
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie