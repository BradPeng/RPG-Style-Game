state = PlayerStateFree;
stateAttack = AttackSlash;
lastState = state;
hitByAttackList = -1;

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
z = 0;
speedWalk = 4.0;
speedRoll = 5.0;
distanceDodge = 30;
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
hookSize = sprite_get_width(s_hook_chain)

spriteRun = s_player_run;
spriteIdle = s_player;
spriteRoll = s_player_roll
localFrame = 0;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.iLifted != noone) {
	//spriteIdle = s_player_carrying;
	//spriteRun = s_player_run_carrying;
	//sprite_index = spriteIdle;
}