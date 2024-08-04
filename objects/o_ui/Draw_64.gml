var _playerHealth = global.player_health;
var _playerHealthMax = global.playerHealthMax;
var _bossId = global.currentBoss;

if (_bossId != -1) {	
	var _currentBoss = instance_find(global.currentBoss, 0);
		
	var _healthbarScale = 150
	
	// Draw boss healthbar
	draw_sprite_stretched(s_healthbar, 0, RESOLUTION_W/2  - (sprite_get_width(s_healthbar) * _healthbarScale/2), 8, _healthbarScale * _currentBoss.enemyHP/_currentBoss.enemyHPMax, 12);
	draw_sprite_stretched(s_healthbar_background, 0, RESOLUTION_W/2  - (sprite_get_width(s_healthbar) * _healthbarScale/2), 8, _healthbarScale, 12);

	// Boss Name
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(RESOLUTION_W/2, 30, "Aeolia Schenberg")
}
/// Draw health bar
draw_sprite_stretched(s_healthbar, 0, 8, 8, 100 * _playerHealth/_playerHealthMax, 12);
draw_sprite_stretched(s_healthbar_background, 0, 8, 8, 100, 12);


// Draw money
var _xx
var _yy

// Coin icon
_xx = 28;
_yy = 31;
draw_sprite(s_coin_ui, 0, _xx, _yy);

// coin text
draw_set_color(c_black);
draw_set_font(f_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
_xx += sprite_get_width(s_coin_ui) + 4;
_yy = 27;
var _str = string(global.playerMoney);

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
draw_sprite(s_item_ui_box, 0, _xx, _yy);
if (global.playerHasAnyItems) {
	draw_sprite(s_item_ui, global.playerEquipped, _xx, _yy);
	if (global.playerAmmo[global.playerEquipped] != -1) {
		draw_set_color(c_white);
		draw_set_font(f_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(
			_xx + sprite_get_width(s_item_ui_box) + 1,
			_yy + sprite_get_height(s_item_ui_box) + 1,
			string(global.playerAmmo[global.playerEquipped])
		);
	}
}

// Pause screen
if (global.gamePaused) {
	// dim background
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0,0,RESOLUTION_W, RESOLUTION_H, false);
	
	// text
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(f_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5, "...Game Paused...");
	for (var i = 0; i < array_length(pauseOption); i++) {
		var _print = "";
		if (i == pauseOptionSelected) {
			_print += "> " + pauseOption[i] + " <";	
		} else {
			_print += pauseOption[i];
			draw_set_alpha(0.75);
		}
		
		draw_text(RESOLUTION_W * 0.5, RESOLUTION_H * 0.5 + 18 + i * 16, _print);
		draw_set_alpha(1)
	}
	
}

//mana bar
//var _mana_bar_width = 100;
//var _manabar_height = 12;
//var _healthbar_x = 70;
//var _healthbar_y = 70;








