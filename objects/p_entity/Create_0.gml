event_inherited();
z = 0;
flash = 0;
flash_shader = sh_white_flash;
u_flash = shader_get_uniform(flash_shader, "flash");
lifted = 0;
thrown = false;
spd = 0;
entity_drop_list = -1; // items that drop when the item breaks