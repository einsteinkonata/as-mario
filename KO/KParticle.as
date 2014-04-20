package KO 
{
	public class KParticle 
	{
		
		public function KParticle() 
		{
			
		}
		
		// Particle information.
		// 粒子的信息。
		/** @private */ internal var _type:KParticleType;
		/** @private */ internal var _time:Number;
		/** @private */ internal var _duration:Number;
		
		// Motion information.
		// 运动信息。
		/** @private */ internal var _x:Number;
		/** @private */ internal var _y:Number;
		/** @private */ internal var _moveX:Number;
		/** @private */ internal var _moveY:Number;
		
		// Gravity information.
		// 重力资料。
		/** @private */ internal var _gravity:Number;
		
		// List information.
		// 列表信息。
		/** @private */ internal var _prev:KParticle;
		/** @private */ internal var _next:KParticle;
		
	}

}