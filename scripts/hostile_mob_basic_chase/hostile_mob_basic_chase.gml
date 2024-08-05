// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hostile_mob_basic_chase(){
	sprite_index = move_sprite;
	if (instance_exists(target)) {
		image_speed = 0;
		sprite_index = move_sprite;
		var _total_frames = sprite_get_number(sprite_index) / 4;
		image_index = local_frame + (CARDINAL_DIR * _total_frames);
		local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;
		
		if (local_frame >= _total_frames) {
			local_frame -= _total_frames
		}	
		x_to = target.x;
		y_to = target.y;
		
		
		
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		image_speed = 1;
		dir = point_direction(x, y, x_to, y_to);
		if (_distance_to_go > enemy_speed) {
			h_speed = lengthdir_x(enemy_speed, dir)	
			v_speed = lengthdir_y(enemy_speed, dir)	
		} else {
			h_speed = lengthdir_x(_distance_to_go, dir)	
			v_speed = lengthdir_y(_distance_to_go, dir)	
		}
		direction = dir;
		
		if (place_meeting(x + h_speed, y + v_speed, target)) {
			hurt_player(dir, 20, enemy_damage_touch);
			
		}
		
		enemy_tile_collision();
	}	
}