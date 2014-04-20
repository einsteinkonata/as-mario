package konata.pig 
{
	import KO.K;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.ArmHelper;
	import konata.mono.Player;
	
	public class PigFB extends PigBase 
	{
		private var trun:int = 2;
		private var jumpY:int = -10;
		
		private var timeNum:Number = 0;
		private var timeMax:Number = 6;
		
		public function PigFB(x:int = 0, y:int = 0, param:Array = null)
		{
			super(x, y, G.Size - 2, G.Size - 2);
			this.x = x;
			this.y = y;
			draw(0x00ff00);
			this.trun = (param != null && param.length > 0) ? param[0] : trun;
			this.Quality = 0.5;
			this.speed = 3;
			
			this.renderData = KSources.getBitmap(4, 7, 2);
		}
		
		
		override public function update():void 
		{
			OnMove();
			OnMoved();
			
			timeNum += K.elapsed;
			if (timeNum >= timeMax) {
				K.game.remove(this);
				ArmHelper.newArmA(this.x + this.width / 2, this.y + this.height / 2);
			}
			remove();
		}
		
		private function OnMoved():void 
		{
			if (hitX.length > 0) {
				trun = (trun == 3) ? 2 : 3;	
			}
		}
		
		private function OnMove():void 
		{
			to_X();
			to_Y();
			
			vertical += Quality * G.Gravity;//
			
			OnMoveHorizontal();
			this.vy = vertical;
			//OnMoveVertical();
			
			hitX = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
			this.x += this.vx;
			this.vx = 0;
			to_X();
			
			hitY = [];
			hitY = KGridHit.HitGridY(this, CGame.map);
			
			vertical = (hitY.length != 0) ? 0 : vertical; // 碰到就 0 下落重力
			if (hitY.length != 0 && this.vy >= 0) {
				vertical = jumpY;
			}
		}
		
		private function OnMoveHorizontal():void
		{
			this.vx = (trun == 3) ? speed : -speed;
		}
		
		override public function vsOBB(obb:KRectangleEntity):void
		{
			if (KHit.RectHitRect(this, obb) == true) {
				//if (obb is Player) {
					//trace(this.y >= obb.y + obb.height, this.y + this.vy < obb.y + obb.height);
					//if (this.y >= obb.y + obb.height && this.y + this.vy < obb.y + obb.height) {
						//CGame.player.vy = 0;
						//CGame.player.y = this.y - CGame.player.height;
						//CGame.player.IsPig = CGame.player.AiJump = CGame.player.IsJump = true;
						//CGame.player.InObject = null;
						//K.game.remove(this);
					//}
					//return;
				//}
			}
		}
	}
}