package konata.mapItem  
{
	import KO.KEntity;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class ItemBase extends KRectangleEntity 
	{
		public var moveType:int = 0;
		public var itemType:int = 0;
		
		//
		public var mappoint:Array;
		
		public function ItemBase(_x:int, _y:int, itemType:int = 0, moveType:int = 0, speed:Number = 0)
		{
			super(_x * G.Size, _y * G.Size, G.Size - 2, G.Size - 2);
			this.itemType = itemType;
			this.moveType = moveType;
			this.speed = (moveType == 1) ? -speed
						:(moveType == 2) ? +speed : speed;
			
			this.mx = this.my = -1;
			
			ItemBitmap();
		}
		
		public function ItemBitmap():void 
		{
			switch(itemType) {
				case 0:
					this.renderData = KSources.getBitmap();
				break;
				case 1:
					this.renderData = KSources.getBitmap(4, 6, 4);
				break;
				case 2:
					this.renderData = KSources.getBitmap(4, 7, 4);
				break;
				case 3:
					this.renderData = KSources.getBitmap(4, 8, 4);
				break;
				case 4:
					this.renderData = KSources.getBitmap(4, 9, 4);
				break;
			}
		}
		
		public function setMap(_x:int, _y:int, item:Array):void {
			mappoint = [_x, _y, item];
			CGame.map[_x][_y] = [0, 0];
		}
		override public function removed():void 
		{
			if (mappoint != null) {
				CGame.map[mappoint[0]][mappoint[1]] = mappoint[2];
			}
		}
	}

}