package konata.pig  
{
	import KO.KAnimMap;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	public class PigG extends PigBase 
	{
		private const distW:int = G.Size * 2.5;
		private var state:int = 0;
		private var trun:int = 0;
		private var speedX:Number = 0;
		
		public function PigG(_x:int,_y:int)
		{
			super(_x, _y, G.Size - 2, G.Size - 6);
			
			this.speed = 6;
			speedX = speed * 0.8;
			
			_animMap = new KAnimMap();
			_animMap.add("move", [408, 418, 428, 438, 448, 458], 0.1);
			_animMap.play("move");
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
				if (this.y >= CGame.player.y) {
					this.y = CGame.player.y;
					this.vy = 0;
					state = 2;
					trun = (this.x > CGame.player.x) ? 0 : 1;
					this.vx = (trun == 0) ? -speedX : speedX;
				}
			}else if (state == 2) {
				this.vx = (trun == 0) ? -speedX : speedX;
				_animMap.update();
				
				if (trun == 1) {
					this.matrix.a = -1;
					this.mx = G.Size;
				}else{
					this.matrix.a = 1;
					this.mx = 0;
				}
			}
			
			
			
			remove();			
		}
		override public function render():void 
		{
			//draw(0xff0000);
			//this.renderData.draw(_animMap._source, this.);
			if (state == 2) {
				this.renderData = _animMap._source;
			}else {
				this.renderData = KSources.getBitmap(4, 1, 9);
			}
		}
	}
}