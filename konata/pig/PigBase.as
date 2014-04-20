package konata.pig
{
	import KO.K;
	import KO.KEntity;
	import KO.KHit;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.mapItem.PigDead;
	
	public class PigBase extends KRectangleEntity 
	{
		public var Quality:Number = 1;
		public var vertical:Number = 0;
		public var hitX:Array;
		public var hitY:Array;
		public var move:int = 0;	// 移动方向 0 不动, 1 左, 2 右
		public var IsSink:int = 0; 	// 是否下落
		//
		public var halfW:int;
		public var halfH:int;
		public var IsCamera:Boolean = false;
		//
		public var mappoint:Array;
		
		public function PigBase(_x:int = 0,_y:int = 0, w:int = 32, h:int = 32)
		{
			super(_x * G.Size, _y * G.Size , w, h);	
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			halfW = this.bitmapW / 2;
			halfH = this.bitmapH / 2;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
			hitLayers = [G.LayerPig];
			
			draw(0x00cccc);
		}
		
		public function remove():void {
			if (this.x < K.Camera.x - G.romX
			|| this.x > K.Camera.x + G.roomX
			|| this.y < K.Camera.y - G.romY
			|| this.y > K.Camera.y + G.roomY) {
				IsCamera = true;
				K.game.remove(this);
			}
		}
		public function setMap(_x:int,_y:int,item:Array):void {
			mappoint = [_x, _y, item];
			CGame.map[_x][_y] = [0, 0];
		} 
		override public function removed():void 
		{
			if (IsCamera == false) {
				K.game.add(new PigDead(this.x, this.y, this.renderData));
			}
			if (mappoint != null) {
				CGame.map[mappoint[0]][mappoint[1]] = mappoint[2];
			}
		}
		
		public function OnSink():void 
		{
			var bool:Boolean = false;
			if (!(this._w >= 0 && this._w < CGame.map.length && this._y >= 0 && this._y < CGame.map[0].length
			&& this._h >= 0 && this._h < CGame.map[0].length && this._x >= 0 && this._x < CGame.map.length)) {
				return;
			}
			if (this.vx > 0) {
				bool = ((CGame.map[this._w][this._y][0] == 0 || CGame.map[this._w][this._y][0] == 2)
					&& (this._y + 1 < CGame.map[0].length && CGame.map[this._w][this._y + 1][0] == 0));
			}
			else if (this.vx < 0) {
				bool = ((CGame.map[this._x ][this._y][0] == 0 || CGame.map[this._x][this._y][0] == 2)
					&& (this._y + 1 < CGame.map[0].length && CGame.map[this._x][this._y + 1][0] == 0));
			}
			if (bool == true) {
				move = (move == 1) ? 2 : 1;
				this.vx *= -1;
			}
		}
		
		override public function vsOBB(obb:KRectangleEntity):void {
			this.x += this.vx;
			if (this.vx != 0 && KHit.RectHitRect(this, obb) == true) {
				if (obb is PigDA || obb is PigE || obb is PigG
				|| obb is PigH || obb is PigI || obb is PigJ) return;
				
				if ((vx > 0 && obb.x > this.x + this.halfW)
				|| (vx < 0 && obb.x + obb.width < this.x + this.halfW)) {
					move = (move == 1) ? 2 : 1;
				}
			}
			this.x -= this.vx;
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