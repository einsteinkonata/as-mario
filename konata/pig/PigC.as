package konata.pig 
{
	import KO.KGridHit;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	
	public class PigC extends KRectangleEntity 
	{
		public var size:int = 26;
		
		private var index:int = 0;
		private var points:Array;
		//
		private var hitX:Array;
		private var hitY:Array;
		
		public function PigC(_x:int = 0, _y:int = 0, params:Array = null)
		{
			super(_x * G.Size, _y * G.Size
				, size * 1, size * 1);
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			draw(0xff0088);
			
			this.points = [[_x * G.Size, _y * G.Size]];
			if(points != null){
				for (var i:int = 0; i < params.length; i += 2) {
					this.points.push([(_x + params[i]) * G.Size, (_y + params[i + 1]) * G.Size]);
					trace(_x, (_x + params[i]), (_y + params[i + 1]));
				}
			}
			//hitLayers = [G.LayerPlayer];
			
			speed = 1.5;
		}
		
		override public function update():void 
		{
			OnMove();
		}
		
		private function OnMove():void
		{
			to_X();
			to_Y();
			
			OnMoveHV();
			
			hitX = [];
			hitY = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
			hitY = KGridHit.HitGridY(this, CGame.map);
		}
		
		private function OnMoveHV():void 
		{
			
			if(Math.abs(this.x - points[index][0]) < this.speed 
			&& Math.abs(this.y - points[index][1]) < this.speed) {
				this.vx = points[index][0] - this.x;
				this.vy = points[index][1] - this.y;
				index += 1 + points.length;
				index %= points.length;
			}else {
				this.vx = (points[index][0] > this.x) ? speed : -speed;
				this.vx = points[index][0] == this.x ? 0 : this.vx;				
				this.vy = (points[index][1] > this.y) ? speed : -speed;
				this.vy = points[index][1] == this.y ? 0 : this.vy;
			}
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