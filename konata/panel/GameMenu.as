package konata.panel   
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KEntity;
	import KO.KInput;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.Game;
	import konata.Helper.TextHelper;
	import konata.particle.BlackCloth;
	
	public class GameMenu extends KEntity 
	{
		
		public function GameMenu() 
		{
			this.bitmapW = K.W;
			this.bitmapH = K.H;
			this.bitmapW *= 2;
			this.bitmapH *= 2;
			
			draw(0, 0);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			this.renderData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			this.renderData.draw(KSources.getBitmap(9), new Matrix(2, 0, 0, 2));
			
			var text:BitmapData = TextHelper.TextToDraw(CGame.mainPoint.toString(), 4);
			var m:Matrix = new Matrix();
			m.tx = K.W - text.width - G.Size;
			m.ty = G.Size;
			this.renderData.draw(text, m);
		}
	}
}