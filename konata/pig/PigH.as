package konata.pig 
{
	import flash.geom.Point;
	import KO.K;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	/**
	 * ...
	 * @author 计算用
	 */
	public class PigH extends PigBase 
	{
		private const distW:int = G.Size * 1.5;
		private var state:int = 0;
		private var time:Number = 0;
		private var timeMax:Number = 2;
		private var stPoint:Point;
		
		public function PigH(_x:int,_y:int)
		{
			super(_x, _y, G.Size - 6, G.Size - 6);
			
			stPoint = new Point(this.x, this.y);
			this.speed = 8;
			this.renderData = KSources.getBitmap(4, 2, 9);
			this.mx = this.my = 3;
		}
		
		override public function update():void 
		{
			if (CGame.player == null) return;
			
			if (state == 0) {
				if (this.y <= CGame.player.y) {
					if (Math.abs(this.x - CGame.player.x) < distW) {
						state = 1;
					}
				}
			}else if (state == 1) {
				this.vy = speed;
				if (this.y > CGame.mapHeight) {
					this.state == 2;
					this.vy = 0;
				}
			}else if (state == 2) {
				time += K.elapsed;
				if (time >= timeMax) {
					time = 0;
					state = 0;
					this.y = stPoint.y;
				}
			}
			
			remove();
		}
	}

}