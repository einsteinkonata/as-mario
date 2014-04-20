package konata.button 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KButton;
	import KO.KSources;
	import konata.G;
	import konata.Game;
	import konata.particle.BlackCloth;
	
	public class KOverReset extends KButton 
	{
		private var text:BitmapData;
		private var textm:Matrix;
		
		public function KOverReset() 
		{
			super(4, 6);
			this.mx = K.Camera.x;
			this.my = K.Camera.y;
			this.bitmapW = 116 * 2;
			this.bitmapH = 40 * 2;
			this.x = K.W / 2;
			this.y = K.H - this.bitmapH - 28 * 2;
			
			var bit:BitmapData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			bit.draw(KSources.getBitmap(11, 0, 1), new Matrix(2, 0, 0, 2));
			this.buttonDown = bit.clone();
			bit.draw(KSources.getBitmap(11), new Matrix(2, 0, 0, 2));
			this.buttonUp = bit.clone();
			this.renderData = buttonUp;
			
			InitText();
		}
		
		private function InitText():void
		{
			textm = new Matrix();
			text = new BitmapData(KSources.getBitmap(13).width * 5, KSources.getBitmap(13).height, true, 0);			
			text.draw(KSources.getBitmap(13, 7, 1));
			textm.tx = KSources.getBitmap(13).width;
			text.draw(KSources.getBitmap(13, 4, 0), textm);
			textm.tx = KSources.getBitmap(13).width * 2;
			text.draw(KSources.getBitmap(13, 8, 1), textm);
			textm.tx = KSources.getBitmap(13).width * 3;
			text.draw(KSources.getBitmap(13, 4, 0), textm);
			textm.tx = KSources.getBitmap(13).width * 4;
			text.draw(KSources.getBitmap(13, 9, 1), textm);
			
			textm.tx = (this.bitmapW - text.width * 2) / 2;
			textm.ty = (this.bitmapH - text.height * 2) / 2;
		}
		
		private var black:BlackCloth = new BlackCloth();
		override public function OnUp():void
		{
			K.game.add(black, K.LayerMain); 
		}
		override public function update():void
		{
			super.update();
			textm.a = textm.d = 2;
			this.renderData.draw(text, textm);
			
			if (black.isOver == true) {
				K.game.removeAll();
				Game.T.InGameStart();
			}
		}
	}
}