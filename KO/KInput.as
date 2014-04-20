package KO {
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import KO.K;

	public class KInput extends Object {

		public static var keyString:String = "";
		public static var lastKey:int;
		public static var click:Boolean = false;
		public static var mouseDown:Boolean = false;
		public static var mouseUp:Boolean = false;
		public static var mousePressed:Boolean = false;
		public static var mouseReleased:Boolean = false;
		public static var mouseWheel:Boolean = false;
		public static var coorX:Number = 0;
		public static var coorY:Number = 0;
		
		private static var _enabled:Boolean = false;
		private static var _key:Vector.<Boolean> = new Vector.<Boolean>(256);
		private static var _lastDown:Point = new Point();

		public function KInput() {
		}

		public static function enable(stage:Stage):void {
			if (!_enabled && stage){
				stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
				//stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
				_enabled = true;
			}
			return;
		}

		public static function update():void {
			if (mousePressed){
				mousePressed = false;
			}
			if (mouseReleased){
				mouseReleased = false;
			}
			if (mouseUp) {
				mouseUp = false;
			}
			if (click){
				click = false;
			}
			coorX = K.stage.mouseX + K.Camera.x;
			coorY = K.stage.mouseY + K.Camera.y;
			return;
		}

		public static function checkKey(param1:int):Boolean {
			return _key[param1];
		}

		static private function onKeyUp(e:KeyboardEvent):void {
			var keyCode:int = e.keyCode;

			if (_key[keyCode]){
				_key[keyCode] = false;
			}
		}

		public static function get mouseX():int {
			return K.stage.mouseX;
		}

		public static function get mouseY():int {
			return K.stage.mouseY;
		}
		
		static public function ClickEntity(entity:KEntity, isClick:Boolean = false):Boolean {
			if (click && entity.containsMouse()) {
				click = isClick;
				return true;
			}
			return false;
		}

		static private function onKeyDown(e:KeyboardEvent):void {
			var keyCode:int = e.keyCode;
			lastKey = keyCode;
			if (!_key[keyCode]){
				_key[keyCode] = true;
			}
		}

		static private function onMouseDown(e:MouseEvent):void {
			if (!mouseDown){
				_lastDown.x = mouseX;
				_lastDown.y = mouseY;
				mouseDown = true;
				mouseUp = false;
				mousePressed = true;
			}
		}

		static private function onMouseUp(e:MouseEvent):void {
			click = _lastDown.equals(new Point(mouseX, mouseY));
			mouseDown = false;
			mouseUp = true;
			mouseReleased = true;
		}

		//static private function onMouseWheel(e:MouseEvent):void {
		//mouseWheel = true;
		//_mouseWheelDelta = e.delta;
		//}
	}
}