package konata.pig  
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.PlayerHelper;
	
	public class PigFA extends PigBase 
	{
		public var trun:int = 1;
		
		public function PigFA(x:int = 0, y:int = 0, param:Array = null)
		{
			super(x, y, G.Size - 2, G.Size - 2);
			this.x = x;
			this.y = y;
			
			this.trun = (param != null && param.length > 0) ? param[0] : 1;
			if(this.trun == 1){
				this.trun = (CGame.player != null && CGame.player.x > this.x) ? 3 : 2;
			}
			this.speed = 8;
			_animMap = new KAnimMap();
			_animMap.add("move", [403, 413, 423, 433], 0.07);
			_animMap.play("move");
			_animMap.update();
			this.renderData = _animMap._source;
		}
		
		override public function update():void
		{
			OnMove();
			OnMoved();
			
			remove();
			
			_animMap.update();
		}
		override public function render():void
		{
			this.renderData = _animMap._source;
		}
		
		private function OnMove():void 
		{
			to_X();
			to_Y();
			
			vertical += Quality * G.Gravity;//
			
			OnMoveHorizontal();
			this.vy = vertical;
			//OnMoveVertical();
			
			hitY = [];
			hitX = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
			hitY = KGridHit.HitGridY(this, CGame.map);
			
			vertical = (hitY.length != 0) ? 0 : vertical; // 碰到就 0 下落重力
		}
		
		private function OnMoved():void 
		{
			if (hitX.length > 0) {
				trun = (trun == 3) ? 2 : 3;	
				for (var i:int = 0; i < hitX.length; i++ ) {
					PlayerHelper.PigHitItem(hitX[i]);
				}
			}
		}
		
		private function OnMoveHorizontal():void
		{
			if (trun == -1) {
				this.vx = 0;
			}
			else if (trun == 2) {
				this.vx = -speed;
			}
			else if (trun == 3) {
				this.vx = speed;
			}
		}
		
		override public function vsOBB(obb:KRectangleEntity):void
		{
			//this.x += this.vx;
			if (KHit.RectHitRect(this, obb) == true) {
				if (obb is PigDA || obb is PigFC || obb is PigI) return;
				if (obb is PigFA) {
					K.game.remove(this);
				}
				K.game.remove(obb);
			}
			//this.x -= this.vx;
		}
	}
}













