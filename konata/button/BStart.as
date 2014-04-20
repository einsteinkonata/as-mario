package konata.button  
{
	import fl.motion.ColorMatrix;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KButton;
	import KO.KSources;
	import konata.G;
	import konata.Game;
	import konata.Helper.TextHelper;
	import konata.particle.BlackCloth;
	
	
	public class BStart extends BStartBase 
	{
		
		public function BStart(x:Number,y:Number,lvNum:String) 
		{
			super(x, y, lvNum);
			this.bitmapW = 64 * 2;
			this.bitmapH = 49 * 2;
			this.buttonUp = KSources.getBitmap(10).clone();
			this.buttonDown = KSources.getBitmap(10).clone();
			this.buttonDown.draw(KSources.getBitmap(10, 3));
			this.mx = this.my = -8;
			
			var m:Matrix = new Matrix();
			m.tx = (buttonUp.width - lv.width) / 2;
			m.ty = buttonUp.height - 3 * 8;
			m.a = m.d = 2;
			this.buttonUp.draw(lv, m);
			this.buttonDown.draw(lv,m);
			
			this.renderData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			this.renderData.draw(buttonUp, new Matrix(2, 0, 0, 2));
		}
	}
}















