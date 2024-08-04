// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_free(){
	if (room == rm_p_test) {
		state = platform_player_state_free;
		return;
	}
	if (blood_aura_magnitude == 1 and global.player_blood_aura_level < global.player_blood_aura_level_max) {
		global.player_blood_aura_level++;
	} else if (blood_aura_magnitude == -1 and global.player_blood_aura_level > 0) {
		global.player_blood_aura_level--;
	}
	
	
	// Movement
	h_speed = lengthdir_x(input_magnitude * speed_walk, input_direction);
	v_speed = lengthdir_y(input_magnitude * speed_walk, input_direction);

	

	// Sprite Index
	var _old_sprite = sprite_index;
	if (input_magnitude != 0) {	
		direction = input_direction;
		sprite_index = run_sprite;
	} else {
		sprite_index = idle_sprite;
	} 

	if (_old_sprite != sprite_index) {
		local_frame = 0;	
	}

	// Image index
	animate_cardinal_sprite()
	
	// attack
	if (key_attack) {
		state = player_state_attack;
		state_attack = attack_slash;
	}
	
	if (key_cast and global.i_lifted == noone) {
		state = player_state_cast;
		switch (global.player_equipped_spell) {
			case SPELL.FIREBOLT:
				state_cast = cast_fire;
				break;
			case SPELL.SHIELD:
				state_cast = cast_shield;
				break;

			default: break;
		}
		
	}
		
	if (key_activate) {
		// check for an entity with script
		var _activate_x = x + lengthdir_x(ACTIVATE_RANGE, direction);
		var _activate_y = y + lengthdir_y(ACTIVATE_RANGE, direction);
		var _activate_size = 12;
		var _activate_list = ds_list_create();
		
		activate = noone;
		var _entities_found = collision_rectangle_list( 
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			p_activatable,
			false,
			true,
			_activate_list,
			true
		);
		
		// if first instance is either our lifted entry, or has no script, try next
		while (_entities_found > 0) {
			var _check = _activate_list[| --_entities_found];	//last element in list //-- reduces then number by 1 first, then returns it
			if (_check != global.i_lifted and _check.activatable_activate_script != -1) {
				activate = _check;	
				break;
			}
		}
		
		ds_list_destroy(_activate_list);

		if (activate == noone) {
			//Throw item if held
			if (global.i_lifted != noone) {
				PlayerThrow();	
			} else {
				state = player_state_roll;
				move_distance_remaining = distance_roll;
			}
		} else { 
			ScriptExecuteArray(activate.activatable_activate_script, activate.activatable_activate_args);	
			// npc face player
			with (activate) {
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}
	if (key_dodge) {
		state = player_state_dodge;
		move_distance_remaining = distance_dodge;
	}
	
	// Use item
	if (key_item and !key_activate and global.player_has_any_items and global.player_equipped != ITEM.NONE) {
		switch (global.player_equipped) {
			case ITEM.BOMB:
				UseItemBomb();
				break;
			case ITEM.BOW:
				UseItemBow();
				break;
			case ITEM.HOOK:
				UseItemHook();
				break;
			default: break;
		}
	}
	
	//Cycle items
	if (global.player_has_any_items) {
		var _cycle_direction = key_item_select_up - key_item_select_down;
		if (_cycle_direction != 0) {
			do {
				global.player_equipped += _cycle_direction;
				
				// If we are at first itme, go to last item
				if (global.player_equipped < 1) {
					global.player_equipped = ITEM.TYPE_COUNT - 1;	
				}
				
				// if we are at last item, go to first item
				if (global.player_equipped >= ITEM.TYPE_COUNT) {
					global.player_equipped = 1;	
				}
			} until (global.player_item_unlocked[global.player_equipped]);
		}
	}
	
	// Cycle spells
	if (global.player_has_any_spells) {
		var _spell_cycle_direction = key_spell_select_up - key_spell_select_down;
		if (_spell_cycle_direction != 0) {
			do {
				global.player_equipped_spell += _spell_cycle_direction;

				// If we are at first spell, go to last spell
				if (global.player_equipped_spell < 1) {
					global.player_equipped_spell = SPELL.TYPE_COUNT - 1;	
				}
				
				// if we are at last spell, go to first spell
				if (global.player_equipped_spell >= SPELL.TYPE_COUNT) {
					global.player_equipped_spell = 1;	
				}
			} until (global.player_spell_unlocked[global.player_equipped_spell]);
		}
	}
	
	player_collision();
}








