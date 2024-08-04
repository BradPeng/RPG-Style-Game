/// @description Insert description here
// You can write your code in this editor
event_inherited();
state = ENEMYSTATE.IDLE;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
time_passed = 0;
wait_duration = 60;
wait = 0;
local_frame = 0
animation_end = false; 
target = obj_player
// check for player in radius every 5 frames
aggro_check = 0;
aggro_check_duration = 5;
state_target = state;
state_previous = state;
state_wait = 0;
state_wait_duration = 0;
enemy_hpMax = enemy_hp;
// Enemy Sprites
move_sprite = -1;
die_sprite = -1
hitbox_sprite = -1
// Enemy Stats
time_passed = 0;

// Enemy functions
enemy_script[ENEMYSTATE.IDLE] = -1;
enemy_script[ENEMYSTATE.WANDER] = hostile_mob_wander;
enemy_script[ENEMYSTATE.CHASE] = hostile_mob_chase;
enemy_script[ENEMYSTATE.ATTACK] = hostile_mob_attack;
enemy_script[ENEMYSTATE.HURT] = hostile_mob_hurt;
enemy_script[ENEMYSTATE.DIE] = -1;
enemy_script[ENEMYSTATE.WAIT] = enemy_wait;



