var _player_health = global.player_health;
var _player_health_max = global.player_health_max;
var _boss_id = global.current_boss;

if (_boss_id != -1) {	
	var _current_boss = instance_find(global.current_boss, 0);
		
	var _healthbar_scale = 150
	
	// Draw boss healthbar
	draw_sprite_stretched(spr_healthbar, 0, RESOLUTION_W/2  - (sprite_get_width(spr_healthbar) * _healthbar_scale/2), 8, _healthbar_scale * _current_boss.enemy_hp/_current_boss.enemy_hp_max, 12);
	draw_sprite_stretched(spr_healthbar_background, 0, RESOLUTION_W/2  - (sprite_get_width(spr_healthbar) * _healthbar_scale/2), 8, _healthbar_scale, 12);

	// Boss Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(RESOLUTION_W/2, 30, "Aeolia Schenberg")
}
/// Draw health bar
draw_sprite_stretched(spr_healthbar, 0, 8, 8, 100 * _player_health/_player_health_max, 12);
draw_sprite_stretched(spr_healthbar_background, 0, 8, 8, 100, 12);


// Draw money
var _xx
var _yy

// Coin icon
_xx = 28;
_yy = 31;
draw_sprite(spr_coin_ui, 0, _xx, _yy);

// coin text
draw_set_color(c_black);
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_xx += sprite_get_width(spr_coin_ui) + 4;
_yy = 27;
var _str = string(global.player_money);

// black outline
draw_text(_xx + 1, _yy, _str);
draw_text(_xx - 1, _yy, _str);
draw_text(_xx, _yy + 1, _str);
draw_text(_xx, _yy - 1, _str);

// actual text
draw_set_color(c_white);
draw_text(_xx, _yy, _str);

// Draw Item UI
_xx = 8;
_yy = 24;
draw_sprite(spr_item_ui_box, 0, _xx, _yy);
if (global.player_has_any_items) {
	draw_sprite(spr_item_ui, global.player_equipped, _xx, _yy);
	if (global.player_ammo[global.player_equipped] != -1) {
		draw_set_color(c_white);
		draw_set_font(fnt_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(
			_xx + sprite_get_width(spr_item_ui_box) + 1,
			_yy + sprite_get_height(spr_item_ui_box) + 1,
			string(global.player_ammo[global.player_equipped])
		);
	}
}

// Pause screen
if (global.game_paused) {
	// dim background
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0,0,RESOLUTION_W, RESOLUTION_H, false);
	
	// text
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...Game Paused...");
	for (var _i = 0; _i < array_length(pause_option); _i++) {
		var _print = "";
		if (_i == pauseOptionSelected) {
			_print += "> " + pause_option[_i] + " <";	
		} else {
			_print += pause_option[_i];
			draw_set_alpha(0.75);
		}
		
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 + _i * 16, _print);
		draw_set_alpha(1)
	}
	
}

//mana bar
//var _mana_bar_width = 100;
//var _manabar_height = 12;
//var _healthbar_x = 70;
//var _healthbar_y = 70;








