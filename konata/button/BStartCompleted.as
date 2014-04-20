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
	
	public class BStartCompleted extends BStartBase 
	{
		
		public function BStartCompleted(x:Number,y:Number,lvNum:String) 
		{
			super(x,y,lvNum);
			this.bitmapW = 64 * 2;
			this.bitmapH = 49 * 2;
			var bit:BitmapData = new BitmapData(72 * 2 , 57 * 2, true, 0);
			bit.draw(KSources.getBitmap(10, 1), new Matrix(2, 0, 0, 2));
			this.buttonUp = bit;
			bit = new BitmapData(72 * 2 , 57 * 2, true, 0);
			bit.draw(KSources.getBitmap(10, 1), new Matrix(2, 0, 0, 2))
			this.buttonDown = bit;
			this.buttonDown.draw(KSources.getBitmap(10, 3), new Matrix(2, 0, 0, 2));
			this.mx = this.my = -16;
			
			var m:Matrix = new Matrix();
			m.tx = (buttonUp.width - lv.width) / 2;
			m.ty = buttonUp.height - 1.5 * G.Size;
			this.buttonUp.draw(lv, m);
			this.buttonDown.draw(lv,m);
			
			this.renderData = buttonUp;
		}
	}
}

















