/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
enemyScript[ENEMYSTATE.IDLE] = MageIdle
enemyScript[ENEMYSTATE.HURT] = MageHurt;
levitationHeight = 0;

enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
z = 0;
print(id)
with(instance_create_layer(x, y, "Instances", o_shadow)) {
	boundEntity = id;
}