lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

// cycle through responses
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
responseSelected += (keyDown - keyUp); 
var _max = array_length(responses) - 1;
var _min = 0;

if (responseSelected > _max) {
	responseSelected = _min;	
}

if (responseSelected < _min) {
	responseSelected = _max;	
}

if (keyboard_check_pressed(vk_space)) {
	var _message_length = string_length(messageText);
	if (textProgress >= _message_length) {
		if (responses[0] != -1) {
			with (originInstance) {
				dialogue_responses(other.responseScripts[other.responseSelected]) 	
			}
		}
		instance_destroy();	
		if (instance_exists(obj_text_queued)) {
			with (obj_text_queued) {
				ticket--;	
			}
		} else {
			with (obj_player) {
				state = lastState	
			}
		}
	} else {
		if (textProgress > 2) {
			textProgress = _message_length;	
		}
	}
}