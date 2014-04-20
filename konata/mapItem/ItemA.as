package konata.mapItem 
{
	import KO.KEntity;
	import KO.KGridHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class ItemA extends ItemBase
	{
		public var vertical:Number = 0;
		private var hitY:Array;
		
		public function ItemA(_x:int,_y:int,itemType:int)
		{
			super(_x, _y + 1, itemType);
			this.vertical -= 8;
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
		}
		
		override public function update():void  
		{
			to_X();
			to_Y();
			
			this.vertical += 0.7;
			if (this.vertical >= 4) this.vertical = 4;
			this.vy = this.vertical;
			
			
			hitY = [];
			hitY = KGridHit.HitGridY(this, CGame.map);
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