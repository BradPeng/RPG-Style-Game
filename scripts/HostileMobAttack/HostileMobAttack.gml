// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HostileMobAttack(){
	if (sprite_index != sprAttack) {
		
		sprite_index = sprAttack
		localFrame = 0;
		image_index = 0;
		
		if (instance_exists(o_player)) {
			EnemyAttack(sprHitbox, point_direction(x,y,o_player.x, o_player.y), enemyForceTouch, 10);
		}
	}

	
	animate_cardinal_sprite();
	if (animationEnd) {
		if (instance_exists(o_player) and (o_player.state != PlayerStateDead)) {
			state = ENEMYSTATE.CHASE;
		} else {
			state = ENEMYSTATE.WANDER;
		}
		animationEnd = false;
	}
}