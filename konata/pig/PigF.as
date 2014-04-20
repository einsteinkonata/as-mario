package konata.pig 
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	import KO.KGridHit;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class PigF extends KEntity 
	{
		private var cenX:int = 0;
		private var cenY:int = 0;
		private var trun:int = 0; // 0 1 2 3  上,下,左,右
		//
		private var actType:int = 0;
		private var timeNum:Number = 0;
		private var timeMax:Number = 4;
		//
		public var mappoint:Array;
		
		public function PigF(_x:int = 0, _y:int = 0, params:Array = null)
		{
			super(_x * G.Size, _y * G.Size);
			this._x = _x;
			this._y = _y;
			this.actType = params.length > 0 ? params[0] : actType;
			this.timeMax = params.length > 1 ? params[1] : timeMax;
			this.timeMax = (actType == 2 && params.length == 1) ? 2.5 : timeMax;
			this.timeNum = timeMax;
			this.bitmapW = G.Size;
			this.bitmapH = G.Size;
			
			cenX = this.x + this.bitmapW / 2;
			cenY = this.y + this.bitmapH / 2;
			
			_animMap = new KAnimMap();
			_animMap.add("move", [406, 416, 426, 436, 446, 456], 0.2);
			_animMap.add("move2", [446, 436, 426, 416, 406], 0.2);
			_animMap.play("move2", false);
		}
		
		override public function update():void
		{
			//OnMove();
			OnTrun();
			
			timeNum += K.elapsed;
			if (timeNum >= timeMax) {
				timeNum = 0;
				_animMap.play("move", false);
			}
			if (_animMap._anim.name == "move" && _animMap.IsOver == true) {
				_animMap.play("move2", false);
				OnAct();
			}
			
			_animMap.update();
		}
		override public function render():void
		{
			this.renderData = _animMap._source;
		}
		public function setMap(_x:int,_y:int,item:Array):void {
			mappoint = [_x, _y, item];
			CGame.map[_x][_y] = [3, 3];
		}
		override public function removed():void 
		{
			if (mappoint != null) {
				CGame.map[mappoint[0]][mappoint[1]] = mappoint[2];
			}
		}
		
		private function OnTrun():void
		{
			trun = (CGame.player != null && CGame.player.x > this.cenX) ? 3 : 2;
		}
		
		private function OnAct():void
		{
			var actobj:PigBase;
			var actX:int = (trun == 2) ? this.x : this.x + this.bitmapW - G.Size;
			var actY:int = this.y;
			if (actType == 0) {
				actobj = new PigFA(actX, actY, [trun]);
			}else if (actType == 1) {
				actobj = new PigFB(actX, actY, [trun]);
			}else if (actType == 2) {
				actobj = new PigFC(actX, actY, [trun]);
			}
			K.game.add(actobj, G.LayerPig); 
		}
	}
}











