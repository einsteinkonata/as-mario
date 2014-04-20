package KO 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import konata.G;
	
	public class KButton extends KEntity 
	{
		public var buttonUp:BitmapData;
		public var buttonDown:BitmapData;
		
		public function KButton(_x:Number,_y:Number) 
		{
			super(_x * G.Size, _y * G.Size);
		}
		
		override public function update():void 
		{
			if (KInput.mouseDown == true && this.containsMouse() == true) {
				this.renderData = buttonDown;
				OnDown();
			}else {
				this.renderData = buttonUp;
			}
			
			if (KInput.mouseUp == true && this.containsMouse() == true) {
				KInput.mouseUp = false;
				OnUp();
			}
		}
		
		public function OnUp():void 
		{
			
		}
		
		public function OnDown():void
		{
			
		}
	}
}