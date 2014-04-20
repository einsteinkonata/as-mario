package konata.panel 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.TextHelper;
	
	public class GamePoint extends KEntity 
	{
		public var rect:Rectangle;
		public var rect2:Rectangle;
		private var txtTime:BitmapData;
		
		private var timeNum:Number;
		public function GamePoint() 
		{
			this.bitmapW = 800;
			this.bitmapH = 64;
			
			rect = new Rectangle(0, 0, K.W, K.H);
			rect2 = new Rectangle(0, 0
				, rect.width / 2  + G.Size * CGame.lv.cameraX
				, rect.height / 2  + G.Size * CGame.lv.cameraY);
			
			this.renderData = new BitmapData(this.bitmapW, this.bitmapH, true, 0xffff0000);
			
			timeNum = 0;
		}
		
		override public function update():void  
		{
			timeNum += K.elapsed;
			CGame.time = Math.floor(timeNum);
			
			drawText();
		}
		
		private function drawText():void {
			this.renderData.fillRect(new Rectangle(0, 0, this.bitmapW, this.bitmapH), 0);
			
			this.renderData.draw(KSources.getBitmap(13, 6, 2), new Matrix(1.5, 0, 0, 1.5, 16, 16));
			
			txtTime = TextHelper.TextToDraw(CGame.time.toString(), 3);
			this.renderData.draw(txtTime, new Matrix(1, 0, 0, 1, 56, 16));
			
			txtTime = TextHelper.TextToDraw(CGame.point.toString(), 3);
			this.renderData.draw(txtTime, new Matrix(1, 0, 0, 1, (this.bitmapW - txtTime.width) / 2, 16));
			
			this.renderData.draw(KSources.getBitmap(4, 6, 6)
			, new Matrix(1, 0, 0, 1, (this.bitmapW - txtTime.width) / 2 - 40, 12));
			
			this.x = K.Camera.x;
			this.y = K.Camera.y;
		}
	}
}