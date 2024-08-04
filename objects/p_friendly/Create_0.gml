/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
sprMove = -1;
state = NPCSTATE.WANDER;
h_speed = 0;
v_speed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;
local_frame = 0;
npcScript[NPCSTATE.WANDER] = NPCWander;
npcScript[NPCSTATE.IDLE] = -1;