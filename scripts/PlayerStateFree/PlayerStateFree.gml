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

	
	// Always point toward mouse
	direction = aim_direction;
	// Sprite Index
	var _old_sprite = sprite_index;
	if (input_magnitude != 0) {	
		sprite_index = run_sprite;
	} else {
		sprite_index = idle_sprite;
	} 

	if (_old_sprite != sprite_index) {
		local_frame = 0;	
	}

	// Image index
	animate_cardinal_sprite()
	
	var _player_weapons = global.player_weapons
	if (key_next_weapon) {
		selected_weapon++
		if (selected_weapon >= array_length(_player_weapons)) { selected_weapon = 0 }
		weapon = _player_weapons[selected_weapon]
	}

	// shoot
	if (shoot_timer > 0) {shoot_timer--}
	if (shoot_key and shoot_timer <= 0 ) {
		var _x_offset  = lengthdir_x(weapon.length /*+weapon_offset_distance*/, aim_direction)
		var _y_offset  = lengthdir_y(weapon.length /*+weapon_offset_distance*/, aim_direction)
	
		var _spread = weapon.spread

		// we want to count spaces between bullets, not number of bullets
		var _spread_division = _spread / max(1, weapon.num_bullets - 1)
		for (var _i = 0; _i < weapon.num_bullets; _i++) {
			var _bullet = instance_create_depth(floor(x), floor(y) - 16, depth, weapon.bullet_obj)	
			with (_bullet) {
				direction = other.aim_direction - _spread / 2 + _spread_division * _i;
				//direction = CARDINAL_DIR * 90;
				image_speed = 0;
				image_index = 0;
				image_angle = direction
				speed = 12;
			}
		}
	
	
		shoot_timer = weapon.cooldown
	}
	
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
			obj_p_activatable,
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
				player_throw();	
			} else {
				state = player_state_roll;
				move_distance_remaining = distance_roll;
			}
		} else { 
			script_execute_array(activate.activatable_activate_script, activate.activatable_activate_args);	
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
				use_item_bomb();
				break;
			case ITEM.BOW:
				use_item_bow();
				break;
			case ITEM.HOOK:
				use_item_hook();
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








