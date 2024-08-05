randomize()
global.game_save_slot = 0;
global.game_paused = false;
global.i_camera = instance_create_layer(0, 0, layer, obj_camera)
global.i_ui =  instance_create_layer(0,0,layer,obj_ui);
global.text_speed = 0.75;
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;
global.i_lifted = noone;
global.i_pushing = noone;
global.player_health_max = 100;
global.player_health = global.player_health_max;
global.player_blood_aura_level = 0;
global.player_blood_aura_level_max = 5;
global.player_money = 100;
global.quest_status = ds_map_create();
global.quest_status[? "TheHatQuest"] = 0;
global.current_boss = -1;
// items
global.player_has_any_items = false;
global.player_equipped = ITEM.BOMB;
global.player_ammo = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's. -1 means don't show ammo amount
global.player_item_unlocked = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's
global.player_ammo[ITEM.BOMB] = 0;
global.player_ammo[ITEM.BOW] = 0;

global.player_has_any_items = true;
global.player_equipped = ITEM.BOMB;
global.player_item_unlocked[ITEM.BOMB] = true;
global.player_ammo[ITEM.BOMB] = 99;

global.player_has_any_items = true;
global.player_equipped = ITEM.BOMB;
global.player_item_unlocked[ITEM.BOW] = true;
global.player_ammo[ITEM.BOW] = 99;

// Spells
global.player_has_any_spells = false;
global.player_equipped_spell = SPELL.FIREBOLT;
global.player_spell_unlocked = array_create(SPELL.TYPE_COUNT, -1);
global.player_spell_unlocked[SPELL.FIREBOLT] = true;
global.player_spell_unlocked[SPELL.SHIELD] = true;
// temp spell setup
global.player_has_any_spells = true
global.player_equipped_spell = SPELL.FIREBOLT;
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START);

// SHOOTING
global.weapon_list = {
	weapon1 : weapon_create(
		spr_arrow, 
		sprite_get_bbox_right(spr_arrow), 
		obj_arrow, 
		9,
		1,
		0
	), 
	weapon2 : weapon_create(
		spr_barrel, 
		sprite_get_bbox_right(spr_arrow), 
		obj_arrow, 
		9,
		5,
		30
	)
}

global.player_weapons = array_create(0)