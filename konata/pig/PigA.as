package konata.pig 
{ 
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.PigMoveHelper;
	
	public class PigA extends PigBase
	{
		public var size:int = 26;		
		public var moveType:int = 0;
		private var jumpY:Number = 10;
		
		public function PigA(_x:int = 0,_y:int = 0, param:Array = null)
		{
			super(_x , _y
				, size * 1, size * 1);
			
			IsSink = param != null && param.length > 0 ? param[0] : 0;
			moveType = param != null && param.length > 1 ? param[1] : moveType;
			move = (CGame.player != null && this.x > CGame.player.x) ? 2 : 1;
			speed = 1;
			
			_animMap = new KAnimMap();
			//_animMap.add("move", [400, 410, 420, 430, 440, 450], 0.15);
			//_animMap.add("move", [401, 411, 421, 431, 421, 411], 0.15);
			//_animMap.add("move", [407, 417, 427, 437, 447, 457], 0.2);	
			_animMap.add("move", [468, 478, 488, 498], 0.2);	
			_animMap.play("move");
			_animMap.update();
			this.renderData = _animMap._source;
			//
			this.my = size - G.Size;
		}
		
		override public function update():void
		{
			if (moveType == 0) {
				PigMoveHelper.moveA(this);
			}else if(moveType == 1) {
				PigMoveHelper.moveB(this);
			}
			// 
			remove();
			_animMap.update();
		}
		override public function render():void 
		{
			this.renderData = _animMap._source;
		}
	}

}