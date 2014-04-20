package KO 
{
	public class KAnim extends Object
	{
		var _parent:KAnimMap;
		var _name:String;
        var _frames:Array;
        var _frameRate:Number;
        var _frameCount:uint;
        var _loop:Boolean;
		
		public function KAnim(name:String, frames:Array, frameRate:Number = 0, param4:Boolean = true) {
			this._name = name;
            this._frames = frames;
            this._frameRate = frameRate;
            this._loop = param4;
            this._frameCount = frames.length;
		}
		
		public function play(param1:Boolean = false) : void
        {
            this._parent.play(this._name, param1);
        }
		
		public function get loop():Boolean {
			return _loop;
		}
		
		public function get frameCount():uint {
			return _frameCount;
		}
		
		public function get frameRate():Number {
			return _frameRate;
		}
		
		public function get frames():Array {
			return _frames;
		}
		
		public function get name():String {
			return _name;
		}
	}
}