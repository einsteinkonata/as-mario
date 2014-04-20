package konata.mapItem 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KEntity;
	import konata.config.CGame;
	
	public class PigDead extends KEntity 
	{
		public var vertical:Number = 0;
		
		public function PigDead(x:Number,y:Number,data:BitmapData) 
		{
			super(x, y);
			this.vertical -= 6;
			this.renderData = new BitmapData(data.width, data.height, true, 0);
			this.renderData.draw(data, new Matrix(1, 0, 0, -1, 0, data.height));
		}
		
		override public function update():void  
		{
			this.vertical += 0.7;
			this.vy = this.vertical;
			
			if (this.y >= CGame.mapHeight) {
				K.game.remove(this);
			}
		}
	}
}