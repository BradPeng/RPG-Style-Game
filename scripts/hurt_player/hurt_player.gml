// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hurt_player(_direction, _force, _damage){
	if (obj_player.invulnerable <= 0) {
		global.player_health = max(0, global.player_health - _damage);
		
		if (global.player_health > 0) {
			with (obj_player) {
				state = player_state_bonk;
				direction = _direction -180;
				move_distance_remaining = _force;
				screen_shake(2, 10);
				flash = 0.7;
				invulnerable = 60;
			}
		} else {
			with (obj_player) {
				direction = _direction
				state = player_state_dead;
			}
		}
	}
}

function drain_player_hp(_damage){
	if (obj_player.invulnerable <= 0) {
		global.player_health = max(0, global.player_health - _damage);
		
		if (global.player_health <= 0) {
			with (obj_player) {
				state = player_state_dead;
			}
		}
	}
}
