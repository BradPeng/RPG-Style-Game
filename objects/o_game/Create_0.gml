randomize()
global.gameSaveSlot = 0;
global.gamePaused = false;
global.iCamera = instance_create_layer(0, 0, layer, o_camera)
global.iUI =  instance_create_layer(0,0,layer,o_ui);
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iLifted = noone;
global.playerHealthMax = 100;
global.playerHealth = global.playerHealthMax;
global.playerBloodAuraLevel = 0;
global.playerBloodAuraLevelMax = 5;
global.playerMoney = 100;
global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

// items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's. -1 means don't show ammo amount
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, -1); // fills array with -1's
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;


surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START);