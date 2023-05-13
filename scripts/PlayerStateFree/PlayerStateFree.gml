// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateFree(){
	
	if (bloodAuraMagnitude == 1 and global.playerBloodAuraLevel < global.playerBloodAuraLevelMax) {
		global.playerBloodAuraLevel++;
	} else if (bloodAuraMagnitude == -1 and global.playerBloodAuraLevel > 0) {
		global.playerBloodAuraLevel--;
	}
	
	
	// Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	

	// Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) {	
		direction = inputDirection;
		sprite_index = spriteRun;
	} else {
		sprite_index = spriteIdle;
	} 

	if (_oldSprite != sprite_index) {
		localFrame = 0;	
	}

	// Image index
	AnimateCardinalSprite()
	
	// attack
	if (keyAttack) {
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	if (keyCast) {
		state = PlayerStateCast;
		stateCast = CastFire;
	}
		
	if (keyActivate) {
		// check for an entity with script
		var _activateX = x + lengthdir_x(ACTIVATE_RANGE, direction);
		var _activateY = y + lengthdir_y(ACTIVATE_RANGE, direction);
		var _activateSize = 12;
		var _activateList = ds_list_create();
		
		activate = noone;
		var _entitiesFound = collision_rectangle_list( 
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			p_activatable,
			false,
			true,
			_activateList,
			true
		);
		
		// if first instance is either our lifted entry, or has no script, try next
		while (_entitiesFound > 0) {
			var _check = _activateList[| --_entitiesFound];	//last element in list //-- reduces then number by 1 first, then returns it
			if (_check != global.iLifted and _check.activatableActivateScript != -1) {
				activate = _check;	
				break;
			}
		}
		
		ds_list_destroy(_activateList);

		if (activate == noone) {
			//Throw item if held
			if (global.iLifted != noone) {
				PlayerThrow();	
			} else {
				state = PlayerStateRoll;
				moveDistanceRemaining = distanceRoll;
			}
		} else { 
			ScriptExecuteArray(activate.activatableActivateScript, activate.activatableActivateArgs);	
			// npc face player
			with (activate) {
				direction = point_direction(x, y, other.x, other.y);
				image_index = CARDINAL_DIR;
			}
		}
	}
	
	// Use item
	if (keyItem and !keyActivate and global.playerHasAnyItems and global.playerEquipped != ITEM.NONE) {
		switch (global.playerEquipped) {
			case ITEM.BOMB:
				UseItemBomb();
				break;
			case ITEM.BOW:
				UseItemBow();
				break;
			case ITEM.HOOK:
				UseItemHook();
				break;
			default: break;
		}
	}
	
	//Cycle items
	if (global.playerHasAnyItems) {
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0) {
			do {
				global.playerEquipped += _cycleDirection;
				
				// If we are at first itme, go to last item
				if (global.playerEquipped < 1) {
					global.playerEquipped = ITEM.TYPE_COUNT - 1;	
				}
				
				// if we are at last item, go to first item
				if (global.playerEquipped >= ITEM.TYPE_COUNT) {
					global.playerEquipped = 1;	
				}
			} until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}
	
	PlayerCollision();
}








