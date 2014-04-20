package konata.pig
{
	import flash.geom.Point;
	import KO.K;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class PigJ extends PigBase
	{
		private var trun:int = 0;
		private var dist:int = 3;
		private var point:Point;
		
		public function PigJ(_x:int, _y:int, params:Array = null)
		{
			super(_x, _y, G.Size - 4, G.Size - 4);
			this._x = _x;
			this._y = _y;
			this.trun = (params != null && params.length > 0) ? params[0] : 1;
			this.dist = (params != null && params.length > 1) ? params[1] : 2;
			this.speed = 8;
			
			this.dist = dist * G.Size;
			
			this.renderData = KSources.getBitmap(4, 7, 3);
			this.mx = this.my = 2;
		}
		
		private var time:int = 0;
		override public function update():void
		{ 
			if (trun == 0){
				time = time + speed + 360;
				time %= 360;
			}else {
				time = time - speed + 360;
				time %= 360;
			}
			var an:Number = time * K.MPI180;
			
			this.x = _x * G.Size + Math.cos(an) * dist;
			this.y = _y * G.Size + Math.sin(an) * dist;
			
			remove();
		}
	}
}