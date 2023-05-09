// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(_direction, _force, _damage){
	if (o_player.invulnerable <= 0) {
		global.playerHealth = max(0, global.playerHealth - _damage);
		
		if (global.playerHealth > 0) {
			with (o_player) {
				state = PlayerStateBonk;
				direction = _direction -180;
				moveDistanceRemaining = _force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
			}
		} else {
			with (o_player) {
				state = PlayerStateDead;
			}
		}
	}
}

function DrainPlayerHP(_damage){
	if (o_player.invulnerable <= 0) {
		global.playerHealth = max(0, global.playerHealth - _damage);
		
		if (global.playerHealth <= 0) {
			with (o_player) {
				state = PlayerStateDead;
			}
		}
	}
}
