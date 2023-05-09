/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
collisionMap = layer_tilemap_get_id(layer_get_id("col"));
sprMove = -1;
sprIdle = -1;
state = NPCSTATE.WANDER;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;
localFrame = 0;
npcScript[NPCSTATE.WANDER] = NPCWander;
npcScript[NPCSTATE.IDLE] = -1;