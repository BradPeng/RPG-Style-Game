/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
move_sprite = -1;
state = NPCSTATE.WANDER;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;
local_frame = 0;
npcScript[NPCSTATE.WANDER] = NPCWander;
npcScript[NPCSTATE.IDLE] = -1;