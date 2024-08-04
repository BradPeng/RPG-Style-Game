state = player_state_free;
state_attack = attack_slash;
lastState = state;
hitByAttackList = -1;
chainAttack = false
image_speed = 0;
h_speed = 0;
v_speed = 0;
z = 0;
speed_walk = 4.0;
speedRoll = 5.0;
distanceDodge = 50;
speedDodge = 3
distanceBonk = 60;
distanceBonkHeight = 20;
distanceRoll = 60;
speedBonk = 1.5
animationEndScript = -1;
actionAnimationEnd = false
endActionFrame = -1
invulnerable = 0;
flash = 0;
flashShader = shRedFlash;
speedHook = 3.0;
distanceHook = 88;
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(spr_hook_chain)

run_sprite = spr_player_run;
idle_sprite = spr_player;
spriteRoll = spr_player_lunge
local_frame = 0;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.i_lifted != noone) {
	//idle_sprite = s_player_carrying;
	//run_sprite = s_player_run_carrying;
	//sprite_index = idle_sprite;
}

// PLATFORM VARIABLES

// Platform Variables
maxSpeed = 4;
acceleration = 1;
gravityAcceleration = .3;
jumpHeight = -8;
grabWidth = 14;
