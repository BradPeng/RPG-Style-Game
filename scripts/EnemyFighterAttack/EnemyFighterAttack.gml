// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyFighterAttack(){
	if (sprite_index != sprAttack) {
		
		sprite_index = sprAttack
		localFrame = 0;
		image_index = 0;
		
		if (instance_exists(o_player)) {
			EnemyAttack(s_player_attac_slash_hb, point_direction(x,y,o_player.x, o_player.y), enemyForceTouch, 10);
		}
	}

	
	AnimateCardinalSprite();
	if (animationEnd) {
		if (instance_exists(o_player) and (o_player.state != PlayerStateDead)) {
			state = ENEMYSTATE.CHASE;
		} else {
			state = ENEMYSTATE.WANDER;
		}
		animationEnd = false;
	}
}