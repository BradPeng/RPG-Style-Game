/// @description Insert description here
// You can write your code in this editor
timer++

if (timer >= spawn_delay) {
	timer = 0
	
	var _original_width = sprite_get_width(sprite_index);
    var _original_height = sprite_get_height(sprite_index);
    
	var _spawner_width = _original_width * image_xscale;
    var _spawner_height = _original_height * image_yscale;
	
    // Generate random x and y coordinates within the sprite's bounds
    var _random_x = x + irandom(_spawner_width) - _spawner_width / 2;
    var _random_y = y + irandom(_spawner_height) - _spawner_height / 2;
	
	// Force cast to silence error
	var _enemy_type_asset = obj_p_hostile_mob
	_enemy_type_asset = enemy_type
	instance_create_layer(_random_x, _random_y, "Instances", _enemy_type_asset)	
}