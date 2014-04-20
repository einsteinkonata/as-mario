package konata.panel  
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	import konata.config.CGame;
	
	public class MapUpdate extends KEntity 
	{
		private var card:KAnimMap;
		private var _timer:Number = 0;
		//
		private var t4:Number = 0;
		
		public function MapUpdate() 
		{
			card = new KAnimMap();
			card.add("move", [466, 466, 466, 466
							, 466, 466, 466, 466
							, 466, 466, 466, 466
							, 466, 476, 486, 496], 0.1);
			card.play("move");
		}
		
		override public function update():void
		{
			updateAnim();
			updateAnimNumber();
			updatePigD();
			
			
			card.update();			
			CGame.animCard = card._source;
		}
		
		private function updatePigD():void 
		{
			CGame.pigD += K.elapsed;
			if (CGame.pigD >= CGame.pigDMax) {
				CGame.pigD = 0;
			}
			
			t4 += K.elapsed * 2;
			if (t4 >= CGame.pig4Max) {
				t4 = 0;
			}
			CGame.pig4 = Math.floor(t4);
		}
		
		private function updateAnimNumber():void 
		{
			if (CGame.IsAnim == true) {
				CGame.anim4 += 1;
				CGame.anim4 %= 4;
				//
				CGame.anim6 += 1;
				CGame.anim6 %= 6;
			}
		}
		
		public function updateAnim():void {
			this._timer = this._timer + (K.elapsed / 0.25);
			while (this._timer >= 1) {
				this._timer = this._timer - 1;
				CGame.IsAnim = true;
				return;
			}
			CGame.IsAnim = false;
		}
	}
}