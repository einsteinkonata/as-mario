package KO {
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	/**
	 * ...
	 * @author aa
	 */
	public class KDraw{
		
		public function KDraw() {
			
		}
		
		public static function DrawText(data:BitmapData, t:TextField,color:int = 0):void {
			data.fillRect(new Rectangle(t.x, t.y, t.width, t.height), color);
			data.draw(t, new Matrix(1, 0, 0, 1, t.x, t.y));
		}
	}
}