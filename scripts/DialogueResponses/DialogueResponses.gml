// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DialogueResponses(response){
	switch (response) {
		case 0: break
		case 1: NewTextBox("Reponse A given!", 1); break;
		case 2: NewTextBox("Resposne B given!. Anything else?", 1, ["3:Yes!", "4:No."]); break;
		case 3: NewTextBox("You said yes", 1); break;
		case 4: NewTextBox("You said no", 1); break;
		case 5: 
			NewTextBox("Thx chief", 2);
			NewTextBox("Its right there",2);
			global.questStatus[? "TheHatQuest"] = 1;
			break;
		case 6:
			NewTextBox("Dam that crazy", 2); break;
		case 7: PurchaseItem(activate.item, activate.itemAmount, activate.itemCost); break;
		default: break;
	
	}
}