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
enemy_script[ENEMYSTATE.HURT] = mage_hurt
enemy_script[MAGESTATE.IDLE] = mage_idle
levitation_height = 0;
attack_cooldown = 120;
attack_timer = attack_cooldown;
enemy_script[MAGESTATE.WANDER] = -1;
enemy_script[MAGESTATE.CHASE] = -1;
enemy_script[MAGESTATE.ATTACK] = mage_attack_s1;
enemy_script[MAGESTATE.ATTACK2] = mage_attack_s2
z = 0;
state = MAGESTATE.IDLE
instance_shadow = instance_create_layer(x, y, "Instances", obj_shadow);
instance_shadow.instance_to_follow = id;
aggro_dialogue = false;
phase_2_dialogue = false;
action_textbox = -1;

// Circular movmement
center_x = 340;
center_y = 250;
circle_radius = 100;
theta = 0;
theta_speed = 2;
x_to = 300;
y_to = 200;
movement_type = true;