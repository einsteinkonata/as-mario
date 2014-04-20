package KO {
	
	public class KTweenObj {
		
		public var scope					:Object;
		public var properties				:Object;
		
		public var timeStart				:Number;	// Time when this tweening should start
		public var timeComplete				:Number;	// Time when this tweening should end
		
		public var useFrames				:Boolean;	// Whether or not to use frames instead of time
		
		public var transition				:Function;	// Equation to control the transition animation
		public var transitionParams			:Object;	// Additional parameters for the transition
		
		public var isPaused					:Boolean;	// Whether or not this tween is paused
		public var timePaused				:Number;	// Time when this tween was paused
		public var isCaller					:Boolean;	// Whether or not this tween is a "caller" tween
		public var timesCalled				:Number;	// How many times the caller has already been called ("caller" tweens only)
		public var waitFrames				:Boolean;	// Whether or not this caller should wait at least one frame for each call execution ("caller" tweens only)
		public var skipUpdates				:Number;	// How many updates should be skipped (default = 0; 1 = update-skip-update-skip...)
		public var updatesSkipped			:Number;	// How many updates have already been skipped
		public var hasStarted				:Boolean;	// Whether or not this tween has already started
		
		public var onComplete				:Function;	// Function to be executed on the object when the tween completes (once)
		public var onCompleteScope			:Object;	// Scope in which the event function is ran
		public var onCompleteParams			:Array;		// Array of parameters to be passed for the event
		
		
		
		
		public function KTweenObj(p_scope:Object, p_timeStart:Number, p_timeComplete:Number, p_useFrames:Boolean, p_transition:Function, p_transitionParams:Object) {
			scope				=	p_scope;
			timeStart			=	p_timeStart;
			timeComplete		=	p_timeComplete;
			useFrames			=	p_useFrames;
			transition			=	p_transition;
			transitionParams	=	p_transitionParams;

			// Other default information
			properties		=	new Object();
			isPaused		=	false;
			//timePaused		=	undefined;
			//isCaller		=	false;
			//updatesSkipped	=	0;
			//timesCalled		=	0;
			//skipUpdates		=	0;
			//hasStarted		=	false;
		}
		
		public static function makePropertiesChain(p_obj : Object) : Object{
			return p_obj;
		}
	}
}