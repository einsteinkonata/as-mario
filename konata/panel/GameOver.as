package konata.panel 
{
	import flash.display.BitmapData;
	import KO.K;
	import KO.KEntity;
	
	public class GameOver extends KEntity 
	{
		public var data:BitmapData;
		
		public function GameOver() 
		{
			this.bitmapW = K.W;
			this.bitmapH = K.H;
			draw(0x000000, 0);
		}
		
		override public function update():void 
		{
			super.update(); 
			
			this.x = K.Camera.x;
			this.y = K.Camera.y;
		}
	}
}