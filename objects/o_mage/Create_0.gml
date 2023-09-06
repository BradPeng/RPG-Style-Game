/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
enum MAGESTATE {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT,
	ATTACK2,
}
enemyScript[ENEMYSTATE.HURT] = MageHurt
enemyScript[MAGESTATE.IDLE] = MageIdle
levitationHeight = 0;
attackCooldown = 120;
attackTimer = attackCooldown;
enemyScript[MAGESTATE.WANDER] = -1;
enemyScript[MAGESTATE.CHASE] = -1;
enemyScript[MAGESTATE.ATTACK] = MageAttackS1;
enemyScript[MAGESTATE.ATTACK2] = MageAttackS2
z = 0;
state = MAGESTATE.IDLE
instanceShadow = instance_create_layer(x, y, "Instances", o_shadow);
instanceShadow.instance_to_follow = id;
aggro_dialogue = false;
phase2Dialogue = false;
actionTextbox = -1;
print(id)