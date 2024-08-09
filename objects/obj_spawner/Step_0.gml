/// @description Insert description here
// You can write your code in this editor
timer++
if (timer >= spawn_delay) {
	timer = 0
	
	var _original_width = sprite_get_width(sprite_index);
    var _original_height = sprite_get_height(sprite_index);
    
	var _spawner_width = _original_width * image_xscale;
    var _spawner_height = _original_height * image_yscale;
	
	// Force cast to silence error
	var _enemy_type_asset = obj_p_hostile_mob
	_enemy_type_asset = enemy_type
  

	var _max_attempts = 10; // Maximum attempts to find a free spot
    var _attempts = 0;
    var _spawned = false;
    
    while (_attempts < _max_attempts && !_spawned) {
        // Generate random x and y coordinates within the sprite's bounds
        var _random_x = x + irandom(_spawner_width) 
        var _random_y = y + irandom(_spawner_height)

		var _enemy_sprite = object_get_sprite(_enemy_type_asset);
       
        // Adjust collision box based on the origin at the bottom center
        var _enemy_bbox_left = _random_x - sprite_get_bbox_left(_enemy_sprite);
        var _enemy_bbox_right = _random_x + sprite_get_bbox_right(_enemy_sprite)/2;
        var _enemy_bbox_top = _random_y + sprite_get_bbox_top(_enemy_sprite)/2;
        var _enemy_bbox_bottom = _random_y - sprite_get_bbox_bottom(_enemy_sprite);
		
		/* The above bounding box settings work, verified using the prints below
		print("x: " + string(_random_x))
		print("y: " + string(_random_y))
		print("bbox_left: " + string(sprite_get_bbox_left(_enemy_sprite)))
		print("bbox_r: " + string(sprite_get_bbox_right(_enemy_sprite)))
		print("bbox_t: " + string(sprite_get_bbox_top(_enemy_sprite)))
		print("bbox_b: " + string(sprite_get_bbox_bottom(_enemy_sprite)))*/
        
		// Check if the spot is free using the enemy's bounding box
        if (!collision_rectangle(_enemy_bbox_left, _enemy_bbox_top, _enemy_bbox_right, _enemy_bbox_bottom, obj_p_hostile_mob, false, false)) {

            instance_create_layer(_random_x, _random_y, "Instances", _enemy_type_asset);
            _spawned = true;
        }
        
        _attempts++;
    }
}