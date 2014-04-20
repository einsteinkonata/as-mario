package konata.panel  
{
	import flash.geom.Matrix;
	import KO.K;
	import KO.KEntity;
	import KO.KInput;
	import KO.KSources;
	import konata.G;
	import konata.Game;
	
	public class GameOP extends KEntity 
	{
		
		public function GameOP() 
		{
			this.bitmapW = 384 * 2;
			this.bitmapH = 256;
			this.bitmapW *= 2;
			this.bitmapH *= 2;
			draw(0x00ff00);
			var m:Matrix = new Matrix();
			m.tx = 0;
			m.ty = 0;			
			this.renderData.draw(KSources.getBitmap(8), m);
			m.tx = 384 * 2;
			this.renderData.draw(KSources.getBitmap(8), m);
			m.tx = 39 * 2;
			m.ty = 22 * 2;
			m.a = m.d = 2;
			this.renderData.draw(KSources.getBitmap(7), m);
		}
		
		override public function removed():void 
		{
			Game.T.InGameMenu();
		}
	}
}