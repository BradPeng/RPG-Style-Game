// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PurchaseItem(_item, _amount, _cost){
	if (global.playerMoney >= _cost) {
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount
		global.playerMoney -= _cost;
		global.playerEquipped = _item;
		instance_destroy(activate);
		
		var _desc = "";
		switch (_item) {
			case ITEM.BOW: _desc = "Its a bow dumbass"; break;
			case ITEM.BOMB: _desc = "It's a bomb dumbass"; break;
			case ITEM.HOOK: _desc = "Its a hookshot"; break;
			default: _desc = "No Item Description Found" break;
		}
		
		NewTextBox(_desc, 1);
	} else {
		NewTextBox("You broke af boy", 1);	
	}
}