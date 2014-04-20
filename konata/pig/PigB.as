package konata.pig  
{
	import KO.KAnimMap;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.PigMoveHelper;
	
	/**
	 * ...
	 * @author 计算用
	 */
	public class PigB extends PigBase 
	{
		public var jumpY:Number = 10;
		public var size:int = 26;
		public var moveType:int = 0;
		
		public function PigB(_x:int = 0, _y:int = 0, param:Array = null)
		{
			super(_x , _y , size * 1, size * 1);
			this.moveType = moveType;
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			
			hitLayers = [G.LayerPig];
			
			IsSink = param != null && param.length > 0 ? param[0] : 1;
			moveType = param != null && param.length > 1 ? param[1] : moveType;
			move = (CGame.player != null && this.x > CGame.player.x) ? 2 : 1;
			speed = 1;
			//
			_animMap = new KAnimMap();
			_animMap.add("move", [467, 477, 487, 497], 0.2);
			_animMap.play("move");
			_animMap.update();
			this.renderData = _animMap._source;
			this.my = -4;
		}
		
		override public function update():void
		{
			if (moveType == 0) {
				PigMoveHelper.moveA(this);
			}else if(moveType == 1){
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