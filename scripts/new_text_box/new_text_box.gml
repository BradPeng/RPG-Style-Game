// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function new_text_box(_message, _background = 0, _responses) {
	if (instance_exists(obj_player)) {
		with (obj_player) {
			sprite_index = spr_player;
			image_index = CARDINAL_DIR;
		}
	}
	var _obj
	if (instance_exists(obj_text)) {
		_obj = obj_text_queued;	
	} else {
		_obj = obj_text; 	
	}
	

	var _text_box = instance_create_layer(0, 0, "Instances", _obj)
	var _obj_id = _text_box.id;
	with (_text_box) {
		_obj_id = id;
		message_text = _message
		background = _background
		if (instance_exists(other)) {
			origin_instance = other.id 	
		} else {
			origin_instance = noone;	
		}
		
		
		if (array_length(_responses) > 0) {
			responses = [];
			array_copy(responses, 0, _responses, 0, array_length(_responses))
			for (var _i = 0; _i < array_length(responses); _i++) {
				// split the colon from response
				var _marker_position = string_pos(":", responses[_i]);
				
				// get id
				response_scripts[_i] = real(string_copy(responses[_i], 1, _marker_position - 1));
				responses[_i] = string_delete(responses[_i], 1, _marker_position);
			}	
		} else {
			responses = [-1];
			response_scripts = [-1];
		}
	}
	
	with (obj_player) {
		if (state != player_state_locked) {
			last_state = state;	
			state = player_state_locked
		}
	}
	return _text_box.id;
}