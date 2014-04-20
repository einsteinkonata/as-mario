package konata.pig  
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	
	public class PigDA extends PigBase 
	{
		private var trun:int = 0;
		private var size:int = 24;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		//
		private var timeNum:Number = 0;
		private var timeMax:Number = 4;
		
		public function PigDA(x:int = 0, y:int = 0, trun:int = 0)
		{
			super(x, y, size, size);
			this.x = x - this.size / 2;
			this.y = y - this.size / 2;
			draw(0xff0000);
			this.trun = trun;
			this.speed = 5.5;
			//
			_animMap = new KAnimMap();
			_animMap.add("move1", [404, 414, 424, 434, 444, 454], 0.1);
			_animMap.add("move2", [405, 415, 425, 435, 445, 455], 0.1);
			//
			this.mx = -4;
			this.my = -4;
			setValue();
		}
		
		private function setValue():void
		{
			speedX = 0;
			speedY = 0;
			
			if (trun == 1) {
				speedX = speed;
				_animMap.play("move1");
				this.matrix.a = 1;
				this.mx = -3;
			}
			else if (trun == 2) {
				speedY = -speed;
				_animMap.play("move2");
			}
			else if (trun == 3) {
				speedY = speed;
				_animMap.play("move2");
				this.matrix.d = -1;
				this.my = G.Size;
			}
			else {
				speedX = -speed;
				_animMap.play("move1");
				this.matrix.a = -1;
				this.mx = G.Size - 3;
			}
		}
		
		override public function update():void
		{
			this.vx = speedX;
			this.vy = speedY;
			
			remove();
			
			_animMap.update();
		}
		override public function render():void 
		{
			this.renderData = _animMap._source;
		}
	}
}








