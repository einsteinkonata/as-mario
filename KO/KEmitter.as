package KO 
{
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author flx
	 */
	public class KEmitter extends KEntity 
	{
		private var active:Boolean = true;
		
		public function KEmitter(source:BitmapData, frameWidth:uint = 0, frameHeight:uint = 0) 
		{
			setSource(source, frameWidth, frameHeight);
			active = true;
		}
		/**
		 * Changes the source image to use for newly added particle types.
		 * @param	source			Source image.
		 * @param	frameWidth		Frame width.
		 * @param	frameHeight		Frame height.
		 */
		public function setSource(source:BitmapData, frameWidth:uint = 0, frameHeight:uint = 0):void
		{
			_source = source;
			if (!_source) {
				trace("Invalid source image.");
				return;
			}
			_width = _source.width;
			_height = _source.height;
			_frameWidth = frameWidth ? frameWidth : _width;
			_frameHeight = frameHeight ? frameHeight : _height;
			_frameCount = uint(_width / _frameWidth) * uint(_height / _frameHeight);
		}
		
		override public function update():void 
		{
			// quit if there are no particles
			if (!_particle) return;
			
			// particle info
			var e:Number = K.elapsed,
				p:KParticle = _particle,
				n:KParticle;
			
			// loop through the particles
			while (p)
			{
				// update time scale
				p._time += e;
				// remove on time-out
				if (p._time >= p._duration)
				{
					if (p._next) p._next._prev = p._prev;
					if (p._prev) p._prev._next = p._next;
					else _particle = p._next;
					n = p._next;
					p._next = _cache;
					p._prev = null;
					_cache = p;
					p = n;
					_particleCount --;
					//removeParticle(p);
					continue;
				}
				
				// get next particle
				p = p._next;
			}
		}
		
		private function removeParticle(p:KParticle):void 
		{
			var n:KParticle;
			if (p._next) p._next._prev = p._prev;
			if (p._prev) p._prev._next = p._next;
			else _particle = p._next;
			n = p._next;
			p._next = _cache;
			p._prev = null;
			_cache = p;
			p = n;
			_particleCount--;
		}
		
		
		/** @private Renders the particles. */
		override public function render():void 
		{
			// quit if there are no particles//target:BitmapData, point:Point, camera:Point
			if (!_particle) return;
			
			// get rendering position
			var _point:Point = new Point();
			_point.x = x;//point.x + 
			_point.y = y;//point.y + 
			
			// particle info
			var t:Number, td:Number,
				p:KParticle = _particle,
				type:KParticleType,
				rect:Rectangle;
			
			// loop through the particles
			while (p)
			{
				// get time scale
				t = p._time / p._duration;
				
				// get particle type
				type = p._type;
				rect = type._frame;
				
				// get position
				td = t;
				_p.x = _point.x + p._x + p._moveX * td - K.Camera.x;
				_p.y = _point.y + p._y + p._moveY * td - K.Camera.y;
				
				// stops particles from moving when gravity is enabled
				// and if emitter.active = false (for game pausing for example)
				if (active)
				{
					p._moveY += p._gravity * td;
				}
				
				// get frame
				rect.x = rect.width * type._frames[uint(td * type._frameCount)];
				rect.y = uint(rect.x / type._width) * rect.height;
				rect.x %= type._width;
				
				// draw particle
				if (type._buffer != null)
				{
					// get alpha
					_tint.alphaMultiplier = type._alpha + type._alphaRange * t;
					
					type._buffer.fillRect(type._bufferRect, 0);
					type._buffer.copyPixels(type._source, rect, K.zero);
					type._buffer.colorTransform(type._bufferRect, _tint);
					// draw particle
					K.render.copyPixels(type._buffer, type._bufferRect, _p, null, null, true);
				}
				else K.render.copyPixels(type._source, rect, _p, null, null, true);
				
				// get next particle
				p = p._next;
			}
			
		}
		
		/**
		 * Creates a new KParticle type for this Emitter.
		 * @param	name		Name of the particle type.
		 * @param	frames		Array of frame indices for the particles to animate.
		 * @return	A new KParticleType object.
		 */
		public function newType(name:String, frames:Array = null):KParticleType
		{
			if (! frames) frames = [0];
			if (_types[name]) {
				trace("Cannot add multiple particle types of the same name");
				return null;
			}
			return (_types[name] = new KParticleType(name, frames, _source, _frameWidth, _frameHeight));
		}
		
		public function setTypeSource(name:String, source:BitmapData, frameWidth:uint = 0, frameHeight:uint = 0):KParticleType {
			return (_types[name] as KParticleType).setSource(source, _frameWidth, _frameHeight);
		}
		/**
		 * Defines the motion range for a particle type.
		 * @param	name			The particle type.
		 * @param	angle			Launch Direction.
		 * @param	distance		Distance to travel.
		 * @param	duration		KParticle duration.
		 * @param	angleRange		Random amount to add to the particle's direction.
		 * @param	distanceRange	Random amount to add to the particle's distance.
		 * @param	durationRange	Random amount to add to the particle's duration.
		 * @param	ease			Optional easer function.
		 * @return	This KParticleType object.
		 */
		public function setMotion(name:String, angle:Number, distance:Number, duration:Number, angleRange:Number = 0, distanceRange:Number = 0, durationRange:Number = 0):KParticleType
		{
			return (_types[name] as KParticleType).setMotion(angle, distance, duration, angleRange, distanceRange, durationRange);
		}
		
		/**
		 * Sets the gravity range for a particle type.
		 * @param	name			The particle type.
		 * @param	gravity			Gravity amount to affect to the particle y velocity.
		 * @param	gravityRange	Random amount to add to the particle's gravity.
		 * @return	This KParticleType object.
		 */
		public function setGravity(name:String, gravity:Number = 0, gravityRange:Number = 0):KParticleType
		{
			return (_types[name] as KParticleType).setGravity(gravity, gravityRange);
		}
		
		/**
		 * Sets the alpha range of the particle type.
		 * @param	name		The particle type.
		 * @param	start		The starting alpha.
		 * @param	finish		The finish alpha.
		 * @param	ease		Optional easer function.
		 * @return	This KParticleType object.
		 */
		public function setAlpha(name:String, start:Number = 1, finish:Number = 0, ease:Function = null):KParticleType
		{
			return (_types[name] as KParticleType).setAlpha(start, finish, ease);
		}
		
		/**
		 * Sets the color range of the particle type.
		 * @param	name		The particle type.
		 * @param	start		The starting color.
		 * @param	finish		The finish color.
		 * @param	ease		Optional easer function.
		 * @return	This KParticleType object.
		 */
		//public function setColor(name:String, start:uint = 0xFFFFFF, finish:uint = 0, ease:Function = null):KParticleType
		//{
			//return (_types[name] as KParticleType).setColor(start, finish, ease);
		//}
		
		/**
		 * Emits a particle.
		 * @param	name		KParticle type to emit.
		 * @param	x			X point to emit from.
		 * @param	y			Y point to emit from.
		 * @return
		 */
		public function emit(name:String, x:Number, y:Number):KParticle
		{
			if (!_types[name]) {
				trace("KParticle type \"" + name + "\" does not exist.");
				return null;
			}
			var p:KParticle, type:KParticleType = _types[name];
			
			if (_cache)
			{
				p = _cache;
				_cache = p._next;
			}
			else p = new KParticle;
			p._next = _particle;
			p._prev = null;
			if (p._next) p._next._prev = p;
			
			p._type = type;
			p._time = 0;
			p._duration = type._duration + type._durationRange * K.random;
			var a:Number = type._angle + type._angleRange * K.random,
				d:Number = type._distance + type._distanceRange * K.random;
			p._moveX = Math.cos(a) * d;
			p._moveY = Math.sin(a) * d;
			p._x = x;
			p._y = y;
			p._gravity = type._gravity + type._gravityRange * K.random;
			_particleCount ++;
			return (_particle = p);
		}
		
		/**
		 * Amount of currently existing particles.
		 */
		public function get particleCount():uint { return _particleCount; }
		
		// KParticle information.
		/** @private */ private var _types:Object = { };
		/** @private */ private var _particle:KParticle;
		/** @private */ private var _cache:KParticle;
		/** @private */ private var _particleCount:uint;
		
		// Source information.
		/** @private */ private var _source:BitmapData;
		/** @private */ private var _width:uint;
		/** @private */ private var _height:uint;
		/** @private */ private var _frameWidth:uint;
		/** @private */ private var _frameHeight:uint;
		/** @private */ private var _frameCount:uint;
		
		// Drawing information.
		/** @private */ private var _p:Point = new Point;
		/** @private */ private var _tint:ColorTransform = new ColorTransform;
	}

}