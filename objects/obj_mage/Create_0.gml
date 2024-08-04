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
enemyScript[ENEMYSTATE.HURT] = mage_hurt
enemyScript[MAGESTATE.IDLE] = mage_idle
levitation_height = 0;
attackCooldown = 120;
attackTimer = attackCooldown;
enemyScript[MAGESTATE.WANDER] = -1;
enemyScript[MAGESTATE.CHASE] = -1;
enemyScript[MAGESTATE.ATTACK] = mage_attack_s1;
enemyScript[MAGESTATE.ATTACK2] = mage_attack_s2
z = 0;
state = MAGESTATE.IDLE
instanceShadow = instance_create_layer(x, y, "Instances", obj_shadow);
instanceShadow.instance_to_follow = id;
aggro_dialogue = false;
phase2Dialogue = false;
actionTextbox = -1;

// Circular movmement
center_x = 340;
center_y = 250;
circle_radius = 100;
theta = 0;
theta_speed = 2;
xTo = 300;
yTo = 200;
movement_type = true;