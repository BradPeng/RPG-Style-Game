/// @description Insert description here
// You can write your code in this editor
event_inherited();
state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;
local_frame = 0
animation_end = false; 
target = obj_player
// check for player in radius every 5 frames
aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;
enemyHPMax = enemyHP;
// Enemy Sprites
sprMove = -1;
sprDie = -1
sprHitbox = -1
// Enemy Stats
timePassed = 0;

// Enemy functions
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = HostileMobWander;
enemyScript[ENEMYSTATE.CHASE] = HostileMobChase;
enemyScript[ENEMYSTATE.ATTACK] = HostileMobAttack;
enemyScript[ENEMYSTATE.HURT] = HostileMobHurt;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;



