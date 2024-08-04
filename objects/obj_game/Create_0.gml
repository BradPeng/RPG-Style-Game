randomize()
global.gameSaveSlot = 0;
global.gamePaused = false;
global.iCamera = instance_create_layer(0, 0, layer, obj_camera)
global.iUI =  instance_create_layer(0,0,layer,obj_ui);
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iLifted = noone;
global.iPushing = noone;
global.playerHealthMax = 100;
global.player_health = global.playerHealthMax;
global.player_blood_aura_level = 0;
global.player_blood_aura_level_max = 5;
global.player_money = 100;
global.quest_status = ds_map_create();
global.quest_status[? "TheHatQuest"] = 0;
global.currentBoss = -1;
// items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's. -1 means don't show ammo amount
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;

global.playerHasAnyItems = true;
global.playerEquipped = ITEM.BOMB;
global.playerItemUnlocked[ITEM.BOMB] = true;
global.playerAmmo[ITEM.BOMB] = 99;

global.playerHasAnyItems = true;
global.playerEquipped = ITEM.BOMB;
global.playerItemUnlocked[ITEM.BOW] = false;
global.playerAmmo[ITEM.BOW] = 99;

// Spells
global.playerHasAnySpells = false;
global.playerEquippedSpell = SPELL.FIREBOLT;
global.playerSpellUnlocked = array_create(SPELL.TYPE_COUNT, -1);
global.playerSpellUnlocked[SPELL.FIREBOLT] = true;
global.playerSpellUnlocked[SPELL.SHIELD] = true;
// temp spell setup
global.playerHasAnySpells = true
global.playerEquippedSpell = SPELL.FIREBOLT;
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START);