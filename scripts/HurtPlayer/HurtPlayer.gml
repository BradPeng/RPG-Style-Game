// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(_direction, _force, _damage){
	if (obj_player.invulnerable <= 0) {
		global.player_health = max(0, global.player_health - _damage);
		
		if (global.player_health > 0) {
			with (obj_player) {
				state = PlayerStateBonk;
				direction = _direction -180;
				moveDistanceRemaining = _force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
			}
		} else {
			with (obj_player) {
				direction = _direction
				state = PlayerStateDead;
			}
		}
	}
}

function DrainPlayerHP(_damage){
	if (obj_player.invulnerable <= 0) {
		global.player_health = max(0, global.player_health - _damage);
		
		if (global.player_health <= 0) {
			with (obj_player) {
				state = PlayerStateDead;
			}
		}
	}
}
