function load_game(_slot){
	global.game_save_slot = _slot;
	var _file = "save" + string(global.game_save_slot) + ".sav";
	show_debug_message(_file);
	if (file_exists(_file)) {
		var _json = load_json_from_file(_file);
		if (instance_exists(obj_player)) {
			with (obj_player) {
				print("test com");
				x = _json[? "posX"];
				y = _json[? "posY"];
			}
		}
	
		//global variables
		global.player_health = _json[? "playerHealth"];
		global.player_health_max = _json[? "player_health_max"];
		global.player_money = _json[? "playerMoney"];
		global.player_equipped = _json[? "player_equipped"];
		global.player_has_any_items = _json[? "player_has_any_items"];
		//global.target_x = _json[? "target_x"];
		//global.target_y = _json[? "target_y"];
		global.player_blood_aura_level = _json[? "playerBloodAuraLevel"];
		global.player_blood_aura_level_max = _json[? "player_blood_aura_level_max"];
		
		// when decoding json, the arrays we encoded are decoded as lists
		// so we need to convert lists to arrays
		for (var _i = 0; _i < ITEM.TYPE_COUNT; _i++) {
			global.player_item_unlocked[_i] = _json[? "player_item_unlocked"][| _i];
			global.player_ammo[_i] = _json[? "player_ammo"][|_i];
		}
		
		ds_map_copy(global.quest_status, _json[? "questStatus"]);
		room_transition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	} else {
		show_debug_message("no save in this slot")
		return false
	}
}

function load_json_from_file(_file_name) {
	var _buffer = buffer_load(_file_name);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}