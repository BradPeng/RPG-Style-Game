// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dialogue_responses(_response){
	switch (_response) {
		case 0: break
		case 1: new_text_box("Reponse A given!", 1); break;
		case 2: new_text_box("Resposne B given!. Anything else?", 1, ["3:Yes!", "4:No."]); break;
		case 3: new_text_box("You said yes", 1); break;
		case 4: new_text_box("You said no", 1); break;
		case 5: 
			new_text_box("Thx chief", 2);
			new_text_box("Its right there",2);
			global.quest_status[? "TheHatQuest"] = 1;
			break;
		case 6:
			new_text_box("Dam that crazy", 2); break;
		case 7: PurchaseItem(activate.item, activate.item_amount, activate.item_cost); break;
		default: break;
	
	}
}