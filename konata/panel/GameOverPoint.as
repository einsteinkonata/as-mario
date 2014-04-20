package konata.panel 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.TextHelper;
	
	public class GameOverPoint extends KEntity 
	{
		private var text1:BitmapData;
		private var text2:BitmapData;
		private var text3:BitmapData;
		private var txtTime:BitmapData;
		
		public function GameOverPoint() 
		{
			this.bitmapW = 8 * G.Size;
			this.bitmapH = K.H - G.Size;
			this.bitmapW *= 2;
			this.bitmapH *= 2;
			
			this.x = (K.W - this.bitmapW) / 2;
			this.y = G.Size;
			
			draw(0x00ffff, 0);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void
		{
			var bit:BitmapData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			bit.draw(KSources.getBitmap(12), new Matrix(2, 0, 0, 2));
			this.renderData = bit;
			
			InitTime();
			InitPoint();
		}
		
		private function InitTime():void 
		{
			var m:Matrix = new Matrix();
			m.tx = 6 * G.Size;
			m.ty = 3 * G.Size;
			m.a = m.d = 2;
			this.renderData.draw(KSources.getBitmap(13, 6, 2), m);
			m.tx += G.Size * 2;
			txtTime = TextHelper.TextToDraw(CGame.time.toString(), 2);
			this.renderData.draw(txtTime, m);
		}
		
		private function InitPoint():void 
		{
			var m:Matrix = new Matrix();
			m.tx = 2 * G.Size;
			m.ty = 6 * G.Size;
			m.a = m.d = 2;
			this.renderData.draw(KSources.getBitmap(4, 6, 6), m);
			var txtLength:int = CGame.mainPoint.toString().length > CGame.point.toString().length
								? CGame.mainPoint.toString().length : CGame.point.toString().length;
			
			m.a = m.d = 2;
			text1 = TextHelper.TextToDraw(CGame.mainPoint.toString(), 2);
			m.tx = this.bitmapW - (G.Size + CGame.mainPoint.toString().length * 16) * 2;
			m.ty = 5 * G.Size;
			this.renderData.draw(text1, m);
			
			CGame.point = (CGame.player == null) ? 10 : CGame.point;
			text2 = TextHelper.TextToDraw(CGame.point.toString(), 2);
			m.tx = this.bitmapW - (G.Size + CGame.point.toString().length * 16) * 2;
			m.ty = 6 * G.Size;
			this.renderData.draw(text2, m);
			
			CGame.mainPoint += (CGame.player == null) ? -CGame.point : CGame.point;
			CGame.mainPoint = Math.max(CGame.mainPoint, 0);
			text3 = TextHelper.TextToDraw(CGame.mainPoint.toString(), 2);
			m.tx = this.bitmapW - (G.Size + CGame.mainPoint.toString().length * 16) * 2;
			m.ty = 7 * G.Size;
			this.renderData.draw(text3, m);
			
			m.a = m.d = 4;
			m.tx = this.bitmapW - (2 * G.Size + txtLength * 16) * 2;
			m.ty = 6 * G.Size;
			var mapIndex:int = (CGame.player == null) ? 8 : 7;
			this.renderData.draw(KSources.getBitmap(6, mapIndex, 4), m);
			m.ty += G.Size;
			this.renderData.draw(KSources.getBitmap(6, 9, 4), m);
		}
		
		override public function update():void  
		{
			this.mx = K.Camera.x;
			this.my = K.Camera.y;
		}
	}
}