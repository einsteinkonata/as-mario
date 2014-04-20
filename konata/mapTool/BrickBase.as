package konata.mapTool  
{
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	
	public class BrickBase extends KRectangleEntity 
	{
		public var mappoint:Array;
		
		public function BrickBase(x:Number, y:Number, width:Number, height:Number) 
		{
			super(x, y, width, height);
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