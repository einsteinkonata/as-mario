package KO {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public class KAnimMap extends Object {
		
		public var _width:uint;
		public var _height:uint;
		public var _anims:Object;
		public var _anim:KAnim;
		public var _source:BitmapData;
		public var _sourceRect:Rectangle;
		protected var _buffer:BitmapData;
		protected var _bufferRect:Rectangle;
		protected var _frame:uint;
		public var _index:uint;
		public var _timer:Number = 0;
		
		private var _IsOver:Boolean;

		public function KAnimMap() {
			this._anims = {};
		}

		public function update():void {
			if (this._anim != null) {// 每帧走的毫秒  / 多少秒换图;
				this._timer = this._timer + (K.elapsed / this._anim._frameRate);
				if (this._timer >= 1){
					while (this._timer >= 1){
						this._timer = this._timer - 1;
						this._index = this._index + 1;
						if (this._index == this._anim._frameCount) {
							_IsOver = true;
							if (this._anim._loop == true) {
								_IsOver = false;
								this._index = 0;
								continue;
							}
							this._index = this._anim._frameCount - 1;
							break;
						}
					}
					this._frame = uint(this._anim._frames[this._index]);
					this.updateBuffer();
				}
			}
			return;
		}

		public function updateBuffer(param1:Boolean = false):void {
			var index0:uint = Math.floor(this._frame / 100);
			var index1:uint = Math.floor((this._frame % 100) / 10);
			var index2:uint = Math.floor(this._frame % 10);
			
			_source = KSources.getBitmap(index0, index1, index2);
			return;
		}

		public function play(param1:String = "", param2:Boolean = true):KAnim {
			_IsOver = false;
			if (this._anim != null && this._anim._name == param1){
				return this._anim;
			}
			this._anim = this._anims[param1];
			this._anim._loop = param2;
			if (!this._anim){
				this._index = 0;
				this._frame = 0;
				this.updateBuffer();
				return null;
			}
			this._index = 0;
			this._timer = 0;
			this._frame = uint(this._anim._frames[0]);
			this.updateBuffer();
			return this._anim;
		}

		public function add(name:String, frames:Array, frameRate:Number = 1, param4:Boolean = true):KAnim {
			if (this._anims[name]){
				throw new Error("animations the same name");
			}
			var anim:KAnim = new KAnim(name, frames, frameRate, param4);
			anim._parent = this;
			//this._anims[name] = new KAnim(name, frames, frameRate, param4);
			this._anims[name] = anim;
			return this._anims[name];
		}
		
		public function get IsOver():Boolean 
		{
			return _IsOver;
		}
	}
}