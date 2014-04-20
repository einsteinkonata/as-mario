package konata.Helper 
{
	import adobe.utils.ProductManager;
	import KO.K;
	import KO.KEntity;
	import konata.arms.armPowUp;
	import konata.config.CGame;
	import konata.G;
	import konata.mapItem.Goal;
	import konata.mapItem.GoalItem;
	import konata.mapItem.ItemA;
	import konata.mapItem.ItemBase;
	import konata.mapItem.ItemCard;
	import konata.mapItem.ItemEeg;
	import konata.mapItem.PlayerItemA;
	import konata.mapItem.PlayerItemB;
	import konata.mapItem.PlayerItemC;
	import konata.mono.Player;
	import konata.particle.Box1;
	import konata.pig.PigA;
	import konata.pig.PigB;
	import konata.pig.PigBase;
	import konata.pig.PigFA;
	import konata.pig.PigFC;
	
	public class PlayerHelper
	{
		public static const states:Array = [3, 1.6, 1.6];
		
		public static function OnAttack(p:Player):void {
			var index:int = p.state - 2;
			if (p.state == 2) {
				if (p.actkNum < states[index]) return;
				p.actkNum -= states[index];
				var itemx:int = p.turn > 0 ? p.x + G.Size : p.x - G.Size - 8;
				K.game.add(new PlayerItemA(itemx, p.y), G.LayerItem);
			}
			else if (p.state == 3) {
				if (p.actkNum < states[index]) return;
				p.actkNum -= states[index];
				K.game.add(new PlayerItemB(p.x + p.width / 2, p.y + p.height / 2,p.turn), G.LayerItem);
			}
			else if (p.state == 4) {
				if (p.actkNum < states[index]) return;
				p.actkNum -= states[index];
				K.game.add(new PlayerItemC(p.x + p.width / 2, p.y + p.height / 2,p.turn), G.LayerItem);
			}
		}
		
		public static function GetItem(p:Player, item:ItemBase) {
			if(item  is ItemA){
				p.state = (item.itemType == 1 && p.state > 1) ? p.state : item.itemType;
				K.game.remove(item);
				K.game.add(new armPowUp());
			}else if (item is ItemCard) {
				CGame.point += 1;
				item.mappoint = null;
				K.game.remove(item);
				ArmHelper.newArmB(item.x + 8, item.y + 8);
				trace(CGame.point);
			}else if (item is Goal) {
				p.activat = false;
				K.game.add(new GoalItem(item.x, item.y));
				ArmHelper.newArmD(item.x, item.y);
			}
		}
		
		public static function HitItem(p:Player, item:Array) {
			var itemx:Number, itemy:Number;
			if (item[2] == 1) {
				if (p.state > 0 && p.IsAir == true && item[3] == 0) { // p.vy < 0
					CGame.map[item[0]][item[1]] = [0, 0];
					itemx = item[0] * G.Size + 8;
					itemy = item[1] * G.Size + 8;
					ArmHelper.newArmD(itemx, itemy);
				}
				else {
					K.game.add(new Box1(item[0], item[1]));
				}
				Item3and0(item);
				Item3and10(item);
				// 碰顶
				p.vy = p.vertical = 0;
				p.IsAir = p.IsJump = true;
			}
			else if (item[2] == 3) {
				Item3and10(item);
			}
		}
		
		public static function PigHitItem(item:Array) {
			var itemx:Number, itemy:Number;
			if (item[2] == 1) {
				if (item[3] == 0) { // p.vy < 0
					CGame.map[item[0]][item[1]] = [0, 0];
					itemx = item[0] * G.Size + 8;
					itemy = item[1] * G.Size + 8;
					ArmHelper.newArmD(itemx, itemy);
				}
				else {
					K.game.add(new Box1(item[0], item[1]));
				}
				Item3and0(item);
				Item3and10(item);
			}
			else if (item[2] == 3) {
				Item3and10(item);
			}
		}
		
		static private function Item3and0(item:Array):void {
			if(item[3] > 0 && item[3] < 10) {
				CGame.map[item[0]][item[1]][1] -= 1;
				CGame.point += 1;
			}
		}
		
		public static function Item3and10(item:Array):void {
			switch(item[3]) {
				case 10:
				case 11:
					K.game.add(new ItemA(item[0], item[1] - 1, (CGame.player.state >= 1) ? 2 : 1), G.LayerItem);
				break;
				case 12:
					K.game.add(new ItemA(item[0], item[1] - 1, (CGame.player.state >= 1) ? 3 : 1), G.LayerItem);
				break;
				case 13:
					K.game.add(new ItemA(item[0], item[1] - 1, (CGame.player.state >= 1) ? 4 : 1), G.LayerItem);
				break;				
				case 19:
					K.game.add(new ItemEeg(item[0], item[1] - 1)); 
				break;
			}
			if (item[3] >= 10 && item[3] < 20) {
				CGame.map[item[0]][item[1]][1] = 0;
			}
		}
		
		
	}
}











