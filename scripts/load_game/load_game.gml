function load_game(_slot){
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	show_debug_message(_file);
	if (file_exists(_file)) {
		var _json = LoadJSONFromFile(_file);
		with (instance_exists(obj_player)) {
			print("test com");
			x = _json[? "posX"];
			y = _json[? "posY"];
		}
	
		//global variables
		global.player_health = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.player_money = _json[? "playerMoney"];
		global.player_equipped = _json[? "player_equipped"];
		global.player_has_any_items = _json[? "player_has_any_items"];
		//global.targetX = _json[? "targetX"];
		//global.targetY = _json[? "targetY"];
		global.player_blood_aura_level = _json[? "playerBloodAuraLevel"];
		global.player_blood_aura_level_max = _json[? "player_blood_aura_level_max"];
		
		// when decoding json, the arrays we encoded are decoded as lists
		// so we need to convert lists to arrays
		for (var _i = 0; _i < ITEM.TYPE_COUNT; _i++) {
			global.player_item_unlocked[_i] = _json[? "player_item_unlocked"][| _i];
			global.player_ammo[_i] = _json[? "player_ammo"][|_i];
		}
		
		ds_map_copy(global.quest_status, _json[? "questStatus"]);
		RoomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	} else {
		show_debug_message("no save in this slot")
		return false
	}
}

function LoadJSONFromFile(_file_name) {
	var _buffer = buffer_load(_file_name);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}