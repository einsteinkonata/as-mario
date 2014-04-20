package konata.mapTool 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class TableA extends KRectangleEntity
	{
		public var moveType:int = 0;
		public var mappoint:Array;
		
		public function TableA(_x:int,_y:int,params:Array = null)//,width:int = 1,height:int = 1,moveType:int = 0,speed:Number = 1
		{
			params = params == null ? new Array() : params;
			var pw:int = params.length > 0 ? params[0] : 1;
			
			super(_x * G.Size, _y * G.Size, pw * G.Size, G.Size);
			
			this.moveType = params.length > 1 ? params[1] : 1;
			this.speed = params.length > 2 ? params[2] : 2;
			
			this.renderData = new BitmapData(this.width, this.height, true, 0);
			for (var i:int = 0; i < pw; i++) {
				this.renderData.draw(KSources.getBitmap(3, 1, 2), new Matrix(1, 0, 0, 1, i * G.Size));
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
		
		override public function update():void 
		{
			if (moveType == 1) {
				this.vy -= speed;
				if (this.y < -height) {
					this.y = CGame.mapHeight;
				}
			}
			else if(moveType == 2) {
				this.vy += speed;
				if (this.y > CGame.CH) {
					this.y = -height - (CGame.mapHeight - CGame.CH);
				}
			}
		}
	}
}
