var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
/// Draw health bar
draw_sprite_stretched(s_healthbar, 0, 8, 8, 100 * _playerHealth/_playerHealthMax, 12);
draw_sprite_stretched(s_healthbar_background, 0, 8, 8, 100, 12);

// Old heart container render
/*var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth); // gets the decimal
_playerHealth -= _playerHealthFrac; // _playerHealth will have # of full hearts we want to draw

for (var i = 1; i <= _playerHealthMax; i++) {
	var _imageIndex = i > _playerHealth;
	if (i == _playerHealth + 1) {
		_imageIndex += _playerHealthFrac > 0;
		_imageIndex += _playerHealthFrac > 0.25;
		_imageIndex += _playerHealthFrac > 0.5;
	}
	
	draw_sprite(s_health, _imageIndex, 8 + (i - 1) * 16, 8);
} */

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








