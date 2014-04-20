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
	
	public class GameBackground extends KEntity 
	{
		private var bmp1:BitmapData;
		private var bmp2:BitmapData;
		private var bmp3:BitmapData;
		
		private var x1:Number = 0;
		private var x2:Number = 0;
		private var x3:Number = 0;
		
		public function GameBackground() 
		{
			this.bitmapW = 800;
			this.bitmapH = 480;
			
			var m:Matrix = new Matrix();
			m.tx = 0;
			m.ty = 0;
			this.renderData = KSources.getBitmap(8).clone();
			
			bmp1 = new BitmapData(this.bitmapW, 64, true, 0);
			bmp1.draw(this.renderData, new Matrix(1, 0, 0, 1, 0, 64 * -2), null, null, new Rectangle(0, 0, bitmapW, 64));
			bmp2 = new BitmapData(this.bitmapW, 64, true, 0);
			bmp2.draw(this.renderData, new Matrix(1, 0, 0, 1, 0, 64 * -3), null, null, new Rectangle(0, 0, bitmapW, 64));
			bmp3 = new BitmapData(this.bitmapW, 64, true, 0);
			bmp3.draw(this.renderData, new Matrix(1, 0, 0, 1, 0, 64 * -4), null, null, new Rectangle(0, 0, bitmapW, 64));
		}
		
		override public function update():void 
		{
			x1 += 0.5 + this.bitmapW;
			x2 -= 1 + this.bitmapW;
			x3 += 2 + this.bitmapW;
			x1 %= this.bitmapW;
			x2 %= this.bitmapW;
			x3 %= this.bitmapW;
			
			this.renderData = KSources.getBitmap(8).clone();
			this.renderData.draw(bmp1, new Matrix(1, 0, 0, 1, x1, 128));
			this.renderData.draw(bmp1, new Matrix(1, 0, 0, 1, x1 - this.bitmapW, 128));
			
			this.renderData.draw(bmp2, new Matrix(1, 0, 0, 1, x2, 192));
			this.renderData.draw(bmp2, new Matrix(1, 0, 0, 1, x2 + this.bitmapW, 192));
			
			this.renderData.draw(bmp3, new Matrix(1, 0, 0, 1, x3, 256));			
			this.renderData.draw(bmp3, new Matrix(1, 0, 0, 1, x3 - this.bitmapW, 256));
			
			this.x = K.Camera.x;
			this.y = K.Camera.y;
		}
	}
}
















