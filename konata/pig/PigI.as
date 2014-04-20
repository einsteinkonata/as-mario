package konata.pig 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import KO.KAnimMap;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	/**
	 * ...
	 * @author 计算用
	 */
	public class PigI extends PigBase 
	{
		private var playerY:int = 0;
		private var moveY:Number = 0;
		private var speedY:Number = 0.8;
		private var speedYMax:Number = 6;
		private var trunY:int = 1;
		
		private var trun:int;
		
		
		public function PigI(_x:int,_y:int)
		{
			super(_x, _y, G.Size - 2, G.Size - 6);		
			
			if (CGame.player != null) {
				this.y = playerY = CGame.player.y;
				this.trun = (this.x > CGame.player.x) ? 0 : 1;
				this.speed = 4;
				this.speed = (trun == 0) ? speed * -1 : speed;
			}
			
			//_animMap = new KAnimMap();
			//_animMap.add("move", [402, 412, 422, 432], 0.07);
			//_animMap.play("move");
			this.renderData = KSources.getBitmap(4, 0, 2);
		}
		
		override public function update():void  
		{
			if (CGame.player == null) return;
			
			this.vx = this.speed;
			
			if (trunY == 0) {
				this.moveY -= speedY;
				this.moveY = (Math.abs(this.moveY) < speedYMax)
					? moveY : -speedYMax;
				trunY = (playerY - this.y) < 1 * G.Size ? 0 : 1;
			}
			else {
				this.moveY += speedY;
				this.moveY = (Math.abs(this.moveY) < speedYMax)
					? moveY : speedYMax;
				trunY = (this.y - playerY) < 1 * G.Size ? 1 : 0;
			}
			
			this.vy = moveY;
			
			remove();
		}
	}
}
















