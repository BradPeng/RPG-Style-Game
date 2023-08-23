/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
enemyScript[ENEMYSTATE.IDLE] = MageIdle
enemyScript[ENEMYSTATE.HURT] = MageHurt;
levitationHeight = 0;
attackCooldown = 120;
attackTimer = attackCooldown;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = MageAttackS1;
z = 15 + 5 * sin(levitationHeight);

instanceShadow = instance_create_layer(x, y, "Instances", o_shadow);
instanceShadow.instance_to_follow = id;
