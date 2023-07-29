event_inherited();
z = 0;
flash = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = 0;
thrown = false;
spd = 0;
entityDropList = []; // items that drop when the item breaks