event_inherited();
z = 0;
flash = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = 0;
thrown = false;
spd = 0;
entityDropList = -1; // items that drop when the item breaks