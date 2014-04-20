package konata.pig 
{
	import flash.geom.Point;
	import KO.K;
	import KO.KEntity;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.mapTool.BrickBase;
	
	
	public class PigD extends KEntity 
	{
		private var cenX:int = 0;
		private var cenY:int = 0;
		private var trun:int = 0; 		// 0 1 2 3 4 上,下,左,右
		private var moveTrun:int = 0;	// 0 1 2 3 4
		private var fortTrun:int = 0;
		//
		private var endPoint:Point = new Point();
		//
		private var timeNum:Number = 0;
		private var timeMax:Number = 2.5;
		//
		public var mappoint:Array;
		
		public function PigD(_x:int = 0, _y:int = 0, params:Array = null)
		{
			super(_x * G.Size, _y * G.Size);
			this._x = _x;
			this._y = _y;
			this.trun = params.length > 0 ? params[0] : trun;
			this.fortTrun = params.length > 1 ? params[1] : fortTrun;
			this.timeMax = CGame.pigDMax;
			this.bitmapW = G.Size;
			this.bitmapH = G.Size;
			this.cenX = this.x + this.bitmapW / 2;
			//
			endPoint.x = 0;
			endPoint.y = 0;
			
			setTrun();
		}	
		// 图片转向
		private function setTrun():void 
		{
			if (trun < 2) {
				trun = (CGame.player != null && CGame.player.x > this.cenX) ? 1 : 0;
			}
			
			if (trun == 0){ // 1 和默认全为 左
				this.renderData = KSources.getBitmap(4, 6);
			}else if(trun == 1){
				this.renderData = KSources.getBitmap(4, 7);
			}else if(trun == 2){
				this.renderData = KSources.getBitmap(4, 8);
			}else if(trun == 3){
				this.renderData = KSources.getBitmap(4, 9);
			}
		}
		public function setMap(_x:int,_y:int,item:Array):void {
			mappoint = [_x, _y, item];
			CGame.map[_x][_y] = [3, 20 + this.fortTrun];
		}
		override public function removed():void 
		{
			if (mappoint != null) {
				CGame.map[mappoint[0]][mappoint[1]] = mappoint[2];
			}
		}
		override public function update():void
		{
			this.timeNum = CGame.pigD;
			// 攻击
			//timeNum += K.elapsed;
			//if (timeNum >= timeMax) {
			if (this.timeNum == 0) {
				setTrun();
				OnAct();
				OnSetMoveTrun();
			}
			// 移动
			if(timeNum >= 0.5 && timeNum < timeMax - 0.5) {
				OnMove();
			}
			
			remove();
		}
		
		private function OnMove():void
		{
			if (moveTrun > 0) {
				var num:Number = timeNum - 0.5;
				var max:Number = timeMax - 1.5;
				var speedParame:Number = (num >= max) ? 1 : num / max;
				var ex:Number = (endPoint.x) * speedParame;
				var ey:Number = (endPoint.y) * speedParame;
				
				this.x = _x * G.Size + ex;
				this.y = _y * G.Size + ey;
			}
		}
		
		private function OnSetMoveTrun():void 
		{
			to_XY();
			var item:Array = CGame.map[_x][_y];
			if (item[0] == 3 && item[1] >= 21 && item[1] < 25) {
				moveTrun = item[1] - 20;
			}
			//
			if (moveTrun == 1) {
				endPoint.x = -1 * G.Size;
				endPoint.y = 0;
			}else if (moveTrun == 2) {
				endPoint.x = 1 * G.Size;
				endPoint.y = 0;
			}else if (moveTrun == 3) {
				endPoint.x = 0;
				endPoint.y = -1 * G.Size;
			}else if (moveTrun == 4) {
				endPoint.x = 0;
				endPoint.y = 1 * G.Size;
			}
		}
		public function remove():void {
			if (this.x < K.Camera.x - G.romX
			|| this.x > K.Camera.x + G.roomX
			|| this.y < K.Camera.y - G.romY
			|| this.y > K.Camera.y + G.roomY) {
				K.game.remove(this);
			}
		}
		private function OnAct():void
		{
			cenX = this.x + this.bitmapW / 2;
			cenY = this.y + this.bitmapH / 2;
			K.game.add(new PigDA(cenX, cenY, trun), G.LayerPig); 
		}
		public function to_XY():void {
			this._x = Math.floor(this.x / G.Size);
			this._y = Math.floor(this.y / G.Size);			
		}
	}
}




















