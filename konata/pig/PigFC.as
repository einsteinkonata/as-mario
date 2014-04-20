package konata.pig 
{
	import KO.K;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class PigFC extends PigBase
	{
		private var jumpY:int = -8;
		
		public function PigFC(x:int = 0, y:int = 0, param:Array = null)
		{
			super(x, y, G.Size - 2, G.Size - 2);
			this.x = x;
			this.y = y;
			this.renderData = KSources.getBitmap(4, 6, 2);
			this.speed = 6;
			this.Quality = 0.5;
			//this.type = "luo";// 洛
			//this.mx = this.my = -1;
			//
			vertical = jumpY;
		}
		
		override public function update():void 
		{
			OnMove();
			
			remove();
		}
		
		private function OnMove():void
		{
			to_X();
			to_Y();
			
			vertical += Quality * G.Gravity;//
			
			this.vy = vertical;
			//OnMoveVertical();
			
			//hitY = [];
			//hitX = [];
			//hitX = KGridHit.HitGridX(this, CGame.map);
			//hitY = KGridHit.HitGridY(this, CGame.map);
			
			//vertical = (hitY.length != 0) ? 0 : vertical; // 碰到就 0 下落重力
			//if (hitY.length != 0 && this.vy >= 0) {
				//vertical = jumpY;
				//for (var i:int = 0; i < hitY.length; i++ ) {
					//if(hitY[i] is Array) {
						//var item:Array = hitY[i];
						//CGame.map[item[0]][item[1]] = [0, 0];
					//}
				//}
			//}
		}
	}
}