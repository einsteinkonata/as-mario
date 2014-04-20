package konata.mapItem  
{
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	
	public class ItemCard extends ItemBase 
	{
		private var IsAuto:Boolean = false;
		
		public function ItemCard(_x:int,_y:int,auto:Boolean = false)
		{
			super(_x, _y);
			this.IsAuto = auto;
			this._x = _x;
			this._y = _y;
			this.speed = 6;
		}
		//override public function update():void 
		//{
			//super.update();
			//
			//if (IsAuto == true && CGame.player != null) {
				//var dx:Number = CGame.player.x - this.x;
				//var dy:Number = CGame.player.y - this.y;
				//var alg:Number = Math.atan2(dy, dx);
				//this.vx = Math.cos(alg) * this.speed;
				//this.vy = Math.sin(alg) * this.speed;
			//}
		//}
		
		override public function render():void 
		{
			this.renderData = CGame.animCard;
		}
	}
}