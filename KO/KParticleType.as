﻿package KO {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	/**
	 * ...
	 * @author flx
	 */
	public class KParticleType {

		public function KParticleType(name:String, frames:Array, source:BitmapData, frameWidth:uint, frameHeight:uint){
			_name = name;
			_source = source;
			_width = source.width;
			_frame = new Rectangle(0, 0, frameWidth, frameHeight);
			_frames = frames;
			_frameCount = frames.length;
		}

		public function setSource(source:BitmapData, frameWidth:uint, frameHeight:uint):KParticleType {
			_source = source;
			_frame = new Rectangle(0, 0, frameWidth, frameHeight);
			return this
		}
		/**
		 * Defines the motion range for this particle type.
		 * @param	angle			Launch Direction.
		 * @param	distance		Distance to travel.
		 * @param	duration		Particle duration.
		 * @param	angleRange		Random amount to add to the particle's direction.
		 * @param	distanceRange	Random amount to add to the particle's distance.
		 * @param	durationRange	Random amount to add to the particle's duration.
		 * @param	ease			Optional easer function.
		 * @return	This ParticleType object.
		 */
		public function setMotion(angle:Number, distance:Number, duration:Number, angleRange:Number = 0, distanceRange:Number = 0, durationRange:Number = 0):KParticleType {
			_angle = angle * K.RAD;
			_distance = distance;
			_duration = duration;
			_angleRange = angleRange * K.RAD;
			_distanceRange = distanceRange;
			_durationRange = durationRange;
			return this;
		}

		/**
		 * Defines the motion range for this particle type based on the vector.
		 * @param	x				X distance to move.
		 * @param	y				Y distance to move.
		 * @param	duration		Particle duration.
		 * @param	durationRange	Random amount to add to the particle's duration.
		 * @param	ease			Optional easer function.
		 * @return	This ParticleType object.
		 */
		public function setMotionVector(x:Number, y:Number, duration:Number, durationRange:Number = 0):KParticleType {
			_angle = Math.atan2(y, x);
			_angleRange = 0;
			_duration = duration;
			_durationRange = durationRange;
			return this;
		}

		/**
		 * Sets the gravity range of this particle type.
		 * @param	gravity			Gravity amount to affect to the particle y velocity.
		 * @param	gravityRange	Random amount to add to the particle's gravity.
		 * @return	This ParticleType object.
		 */
		public function setGravity(gravity:Number = 0, gravityRange:Number = 0):KParticleType {
			_gravity = gravity;
			_gravityRange = gravityRange;
			return this;
		}

		/**
		 * Sets the alpha range of this particle type.
		 * @param	start		The starting alpha.
		 * @param	finish		The finish alpha.
		 * @param	ease		Optional easer function.
		 * @return	This ParticleType object.
		 */
		public function setAlpha(start:Number = 1, finish:Number = 0, ease:Function = null):KParticleType {
			start = start < 0 ? 0 : (start > 1 ? 1 : start);
			finish = finish < 0 ? 0 : (finish > 1 ? 1 : finish);
			_alpha = start;
			_alphaRange = finish - start;
			createBuffer();
			return this;
		}

		/**
		 * Sets the color range of this particle type.
		 * @param	start		The starting color.
		 * @param	finish		The finish color.
		 * @param	ease		Optional easer function.
		 * @return	This ParticleType object.
		 */
		//public function setColor(start:uint = 0xFFFFFF, finish:uint = 0, ease:Function = null):KParticleType {
			//start &= 0xFFFFFF;
			//finish &= 0xFFFFFF;
			//_red = (start >> 16 & 0xFF) / 255;
			//_green = (start >> 8 & 0xFF) / 255;
			//_blue = (start & 0xFF) / 255;
			//_redRange = (finish >> 16 & 0xFF) / 255 - _red;
			//_greenRange = (finish >> 8 & 0xFF) / 255 - _green;
			//_blueRange = (finish & 0xFF) / 255 - _blue;
			//_colorEase = ease;
			//createBuffer();
			//return this;
		//}

		/** @private Creates the buffer if it doesn't exist. */
		private function createBuffer():void {
			if (_buffer != null)
				return;
			_buffer = new BitmapData(_frame.width, _frame.height, true, 0);
			_bufferRect = _buffer.rect;
		}

		// Particle information.
		// 粒子的信息。
		/** @private */
		internal var _name:String;
		/** @private */
		internal var _source:BitmapData;
		/** @private */
		internal var _width:uint;
		/** @private */
		internal var _frame:Rectangle;
		/** @private */
		internal var _frames:Array;
		/** @private */
		internal var _frameCount:uint;

		// Motion information.
		// 运动信息。
		/** @private */
		internal var _angle:Number;
		/** @private */
		internal var _angleRange:Number;
		/** @private */
		internal var _distance:Number;
		/** @private */
		internal var _distanceRange:Number;
		/** @private */
		internal var _duration:Number;
		/** @private */
		internal var _durationRange:Number;

		// Gravity information.
		// 重力资料。
		/** @private */
		internal var _gravity:Number = 0;
		/** @private */
		internal var _gravityRange:Number = 0;

		// Alpha information.
		// alpha信息。
		/** @private */
		internal var _alpha:Number = 1;
		/** @private */
		internal var _alphaRange:Number = 0;
		/** @private */
		//internal var _alphaEase:Function;

		// Color information.
		// 颜色信息。
		///** @private */
		//internal var _red:Number = 1;
		///** @private */
		//internal var _redRange:Number = 0;
		///** @private */
		//internal var _green:Number = 1;
		///** @private */
		//internal var _greenRange:Number = 0;
		///** @private */
		//internal var _blue:Number = 1;
		///** @private */
		//internal var _blueRange:Number = 0;
		///** @private */
		//internal var _colorEase:Function;

		// Buffer information.
		// 缓冲区内的信息。
		/** @private */
		internal var _buffer:BitmapData;
		/** @private */
		internal var _bufferRect:Rectangle;
	}

}