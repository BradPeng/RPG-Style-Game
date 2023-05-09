// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(_message, _background = 0, _responses) {
	if (instance_exists(o_player)) {
		with (o_player) {
			sprite_index = s_player;
			image_index = CARDINAL_DIR;
		}
	}
	var _obj
	if (instance_exists(o_text)) {
		_obj = o_text_queued;	
	} else {
		_obj = o_text; 	
	}
	
	with (instance_create_layer(0, 0, "Instances", _obj)) {
		messageText = _message
		background = _background
		if (instance_exists(other)) {
			originInstance = other.id 	
		} else {
			originInstance = noone;	
		}
		
		
		if (array_length(_responses) > 0) {
			responses = [];
			array_copy(responses, 0, _responses, 0, array_length(_responses))
			for (var i = 0; i < array_length(responses); i++) {
				// split the colon from response
				var _markerPosition = string_pos(":", responses[i]);
				
				// get id
				responseScripts[i] = real(string_copy(responses[i], 1, _markerPosition - 1));
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}	
		} else {
			responses = [-1];
			responseScripts = [-1];
		}
	}
	
	with (o_player) {
		if (state != PlayerStateLocked) {
			lastState = state;	
			state = PlayerStateLocked
		}
	}
}