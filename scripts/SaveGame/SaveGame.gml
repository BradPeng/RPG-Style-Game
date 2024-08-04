// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	// Create Save Map
	var _map = ds_map_create();
	if (instance_exists(obj_player)) {
		print("test");
		_map[? "posX"] = obj_player.x;	
		_map[? "posY"] = obj_player.y;	
	}
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.player_health;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.player_money;
	_map[? "player_item_unlocked"] = global.player_item_unlocked;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "player_equipped"] = global.player_equipped;
	_map[? "player_has_any_items"] = global.player_has_any_items;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	_map[? "posY"] = global.targetY;
	
	_map[? "playerBloodAuraLevel"] = global.player_blood_aura_level;
	_map[? "player_blood_aura_level_max"] = global.player_blood_aura_level_max;
	
	// maps hold pointers to actual map data, so we need to copy 
	// the data in the map into a temp map, and store the temp map into the actual map
	// when we delete _map, garbage collection will clear out the data of all the data
	// inside the map. So we don't want to pass in the original map.
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.quest_status);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	// save all data into string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	// nuke data
	ds_map_destroy(_map);
	show_debug_message("Game Saved");
}

// save to file REEEEEEEEEEEEEEEEEEEE
function SaveStringToFile(_filename, _string) {
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}










