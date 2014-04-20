package konata.mapItem 
{
	import KO.K;
	import KO.KEntity;
	import KO.KGridHit;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.ArmHelper;
	import konata.pig.PigA;
	import konata.pig.PigB;
	import konata.pig.PigBase;
	import konata.pig.PigFA;
	import konata.pig.PigFC;
	
	public class ItemEeg extends KEntity 
	{
		public var vertical:Number = 0;
		private var hitY:Array;
		private var itemNum:int = 0;
		
		public function ItemEeg(x:Number, y:Number)
		{
			super(x * G.Size, y * G.Size);
			this.vertical -= 6;
			this.renderData = KSources.getBitmap(4, 8, 9);			
			this.itemNum = K.randomInt(10);
			
			this.bitmapW = G.Size - 2;
			this.bitmapH = G.Size - 2;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
		}
		
		override public function update():void 
		{
			to_X();
			to_Y();
			
			this.vertical += 0.5;
			if (this.vertical >= 5) this.vertical = 5;
			this.vy = this.vertical;
			
			
			hitY = [];
			hitY = KGridHit.HitGridY(this, CGame.map);
			if (this.vy >= 0 && hitY != null && hitY.length > 0 && hitY[0][1] > this._y) {
				ItemRandom();
				K.game.remove(this);
			}
		}
		
		private function ItemRandom():void 
		{
			var i:int;
			var pig:PigBase;
			var ix:int = _x;
			var iy:int = _y;
			switch(itemNum) {
				case 0:
					itemNum = (CGame.player != null && CGame.player.state >= 1) ? K.randomInt(2) + 2 : 1;
					K.game.add(new ItemA(ix, iy, itemNum), G.LayerItem);
				break;
				case 1:
				case 2:
					for (i = 0; i < 5; i++) {
						itemNum = iy - i;
						if (itemNum >= 0 
						&& CGame.map[ix][itemNum][0] == 0 
						&& CGame.map[ix][itemNum][1] == 0) {
							var itembase:ItemBase = new ItemCard(ix, itemNum);
							itembase.setMap(ix, itemNum, [0, 90]);
							K.game.add(itembase, G.LayerItem);
						}else {
							return;
						}
					}
				break;
				case 3:
				case 4:
					pig = new PigA(ix, iy);
					K.game.add(pig, G.LayerPig);
				break;
				case 5:
				case 6:
					pig = new PigB(ix, iy);
					K.game.add(pig, G.LayerPig);
				break;
				case 7:
				case 8:
					pig = new PigFA(ix * G.Size, iy * G.Size);
					K.game.add(pig, G.LayerPig);
				break;
				case 9:
				case 10:
					pig = new PigFC(ix * G.Size, iy * G.Size);
					K.game.add(pig, G.LayerPig); 
				break;
			}
			ArmHelper.newArmA(this.x + this.bitmapW / 2, this.y + this.bitmapH / 2);
		}
		
		public function to_X():void {
			this._x = Math.floor(this.x / G.Size);
			this._w = Math.floor((this.x + this.bitmapW) / G.Size);
		}
		public function to_Y():void {
			this._y = Math.floor(this.y / G.Size);
			this._h = Math.floor((this.y + this.bitmapH) / G.Size);
		}
	}

}