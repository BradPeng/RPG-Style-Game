key_left = 0
key_right = 0
key_up = 0
key_down = 0
key_blood_aura_up = 0
key_blood_aura_down = 0
key_activate = 0
key_attack = 0
key_item = 0
key_item_select_up = 0
key_item_select_down = 0
key_cast = 0
key_spell_select_up = 0
key_spell_select_down = 0
key_dodge = 0
key_up_release = 0
blood_aura_magnitude = 0
input_direction = 0
input_magnitude = 0

state = player_state_free;
state_attack = attack_slash;
last_state = state;
hit_by_attack_list = -1;
chain_attack = false
image_speed = 0;
h_speed = 0;
v_speed = 0;
z = 0;
speed_walk = 4.0;
speed_roll = 5.0;
distance_dodge = 50;
speed_dodge = 3
distance_bonk = 60;
distance_bonk_height = 20;
distance_roll = 60;
speed_bonk = 1.5
animation_end_script = -1;
action_animation_end = false
end_action_frame = -1
invulnerable = 0;
flash = 0;
flash_shader = sh_red_flash;
speed_hook = 3.0;
distance_hook = 88;
hook = 0;
hook_x = 0;
hook_y = 0;
hook_size = sprite_get_width(spr_hook_chain)

run_sprite = spr_player_run;
idle_sprite = spr_player;
roll_sprite = spr_player_lunge
local_frame = 0;

if (global.target_x != -1) {
	x = global.target_x;
	y = global.target_y;
	direction = global.target_direction;
}

if (global.i_lifted != noone) {
	//idle_sprite = s_player_carrying;
	//run_sprite = s_player_run_carrying;
	//sprite_index = idle_sprite;
}

// PLATFORM VARIABLES

// Platform Variables
max_speed = 4;
acceleration = 1;
gravity_acceleration = .3;
jump_height = -8;
grab_width = 14;

u_flash = 0