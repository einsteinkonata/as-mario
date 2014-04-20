package KO {
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;

	public class KSound {
		private var _vol:Number = 1; // 声音
		private var _pan:Number = 0; // 声道 -1 : 1
		private var _sound:Sound;
		private var _channel:SoundChannel;
		private var _transform:SoundTransform;
		private var _position:Number = 0; // 播放进度
		private var _looping:Boolean;// 循环

		public function KSound(param1:Sound){
			this._transform = new SoundTransform();
			_sound = param1;
		}

		// 大小, 左右声道
		public function play(param1:Number = 1, param2:Number = 0):void {
			if (this._channel) {
				this.stop();
			}

			var value1:Number = param1 < 0 ? (0) : (param1);
			this._transform.volume = value1;
			this._vol = value1;

			var value2:Number = param2 < -1 ? (-1) : (param2 > 1 ? (1) : (param2));
			this._transform.pan = value2;
			this._pan = value2;
			this._channel = this._sound.play(0, 0, this._transform);
			this._channel.addEventListener(Event.SOUND_COMPLETE, this.onComplete);
			this._looping = false;
			this._position = 0;
			return;
		}

		// 循环播放
		public function loop(param1:Number = 1, param2:Number = 0):void {
			this.play(param1, param2);
			this._looping = true;
			return;
		}

		// 停播放
		public function stop():Boolean {
			if (!this._channel) {
				return false;
			}
			this._position = this._channel.position;
			this._channel.removeEventListener(Event.SOUND_COMPLETE, this.onComplete);
			this._channel.stop();
			this._channel = null;
			return true;
		}

		// 恢复播放
		public function resume():Boolean {
			if (this._channel) {
				return false;
			}
			this._channel = this._sound.play(this._position, 0, this._transform);
			this._channel.addEventListener(Event.SOUND_COMPLETE, this.onComplete);
			this._position = 0;
			return true;
		}

		private function onComplete(event:Event = null):void {
			if (this._looping) {
				this.loop(this._vol, this._pan);
			} else {
				this.stop();
			}
			this._position = 0;
			return;
		}

		public function get volume():Number {
			return this._vol;
		}

		public function set volume(param1:Number):void {
			if (param1 < 0) {
				param1 = 0;
			}
			if (!this._channel || this._vol == param1) {
				return;
			}
			this._transform.volume = param1;
			this._vol = param1;
			this._channel.soundTransform = this._transform;
			return;
		}

		public function get pan():Number {
			return this._pan;
		}

		public function set pan(param1:Number):void {
			param1 = param1 < -1 ? (-1) : (param1 > 1 ? (1) : (param1));
			
			if (!this._channel || this._pan == param1){
				return;
			}
			this._transform.pan = param1;
			this._pan = param1;
			this._channel.soundTransform = this._transform;
			return;
		}

		public function get playing():Boolean {
			return this._channel != null;
		}

		public function get position():Number {
			return (this._channel ? (this._channel.position) : (this._position)) / 1000;
		}

		public function get length():Number {
			return this._sound.length / 1000;
		}
	}
}

















