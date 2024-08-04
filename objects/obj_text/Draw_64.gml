draw_sprite_stretched(spr_textbox_bg, string(background), x1, y1, x2 - x1, y2 - y1); // background should already be string
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _message_text_string = string(message_text)
var _print = string_copy(_message_text_string, 1, text_progress); // message_text should alreayd be string
if (array_length(responses)> 0 and responses[0] != -1 and text_progress >= string_length(_message_text_string)) {
	for (var _i = 0; _i < array_length(responses); _i++) {
		_print += "\n";
		if (_i == response_selected) {
			_print += "> ";
			
		}
		_print += responses[_i];
		if (_i == response_selected) {
			_print += " <";	
		}
	}
}

draw_text((x1 + x2)/2, y1 + 8, _print);
draw_set_color(c_white);
draw_text((x1 + x2)/2, y1 + 7, _print);