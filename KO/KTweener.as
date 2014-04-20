package KO {
	import flash.utils.getTimer;
	
	public class KTweener {
		private static var _engineExists:Boolean = false;
		private static var _inited:Boolean = false;
		//private static var _currentTime:Number;	
		private static var _currentTimeFrame:Number;
		
		private static var _tweenList:Array;
		private static var _transitionList:Object;
		
		//private static var _timeScale:Number = 1;				// Time scale (default = 1)
		
		
		public function KTweener() {
			trace ("Tweener is a static class and should not be instantiated.");
			var obj:Object = new Object();
		}
		
		public static function addTween(p_scopes:Object = null, p_parameters:Object = null):Boolean {
			if (!Boolean(p_scopes)) return false;

			var i:Number, j:Number, istr:String;

			var rScopes:Array; // List of objects to tween
			if (p_scopes is Array) {// The first argument is an array
				rScopes = p_scopes.concat();
			} else {// The first argument(s) is(are) object(s)
				rScopes = [p_scopes];
			}
			// make properties chain ("inheritance")
    		var p_obj:Object = KTweenObj.makePropertiesChain(p_parameters);
			
			var rTime:Number = (isNaN(p_obj.time) ? 0 : p_obj.time); // Real time
			var rDelay:Number = (isNaN(p_obj.delay) ? 0 : p_obj.delay); // Real delay
			
			var rProperties:Array = new Array(); // Object containing a list of PropertyInfoObj instances
			var restrictedWords:Object = {time:true, delay:true, useFrames:true, transition:true, transitionParams:true,onComplete:true,onCompleteParams:true};
			//var restrictedWords:Object = {overwrite:true, time:true, delay:true, useFrames:true, skipUpdates:true, transition:true, transitionParams:true, onStart:true, onUpdate:true, onComplete:true, onOverwrite:true, onError:true, rounded:true, onStartParams:true, onUpdateParams:true, onCompleteParams:true, onOverwriteParams:true, onStartScope:true, onUpdateScope:true, onCompleteScope:true, onOverwriteScope:true, onErrorScope:true};
			//var modifiedProperties:Object = new Object();
			for (istr in p_obj) {
				if (!restrictedWords[istr]) {
					rProperties[istr] = { valueStart:undefined, valueComplete:p_obj[istr] };
				}
			}
			
			var rTransition:Function; // Real transition
			if (typeof p_obj.transition == "string") {// String parameter, transition names				
				var trans:String = p_obj.transition.toLowerCase();
				rTransition = _transitionList[trans];
			} else {// Proper transition function
				rTransition = p_obj.transition;
			}
			//easeoutexpo:easenone:linear
			if (!Boolean(rTransition)) rTransition = _transitionList["linear"];
			
			var nProperties:Object;
			var nTween:KTweenObj;
			var myT:Number;
			
			for (i = 0; i < rScopes.length; i++) {
				// Makes a copy of the properties
				nProperties = new Object();
				for (istr in rProperties) {
					nProperties[istr] = new KPropertyInfoObj(rProperties[istr].valueStart, rProperties[istr].valueComplete, rProperties[istr].valueComplete, rProperties[istr].arrayIndex, {}, rProperties[istr].isSpecialProperty, rProperties[istr].modifierFunction, rProperties[istr].modifierParameters);
				}
				
				//if (p_obj.useFrames == true) {
					//nTween = new KTweenObj(
						///* scope			*/	rScopes[i],
						///* timeStart		*/	_currentTimeFrame + (rDelay / _timeScale),
						///* timeComplete		*/	_currentTimeFrame + ((rDelay + rTime) / _timeScale),
						///* useFrames		*/	true,
						///* transition		*/	rTransition,
												//p_obj.transitionParams
					//);
				//} else {
					nTween = new KTweenObj(
						/* scope			*/	rScopes[i],
						/* timeStart		*/	K._time + (rDelay * 1000),
						/* timeComplete		*/	K._time + ((rDelay * 1000) + (rTime * 1000)),
						/* useFrames		*/	false,
						/* transition		*/	rTransition,
												p_obj.transitionParams
					);
				//}
				nTween.properties			=	nProperties;
				//nTween.onStart				=	p_obj.onStart;
				//nTween.onUpdate				=	p_obj.onUpdate;
				nTween.onComplete			=	p_obj.onComplete;
				//nTween.onOverwrite			=	p_obj.onOverwrite;
				//nTween.onError			    =	p_obj.onError;
				//nTween.onStartParams		=	p_obj.onStartParams;
				//nTween.onUpdateParams		=	p_obj.onUpdateParams;
				nTween.onCompleteParams		=	p_obj.onCompleteParams;
				//nTween.onOverwriteParams	=	p_obj.onOverwriteParams;
				//nTween.onStartScope			=	p_obj.onStartScope;
				//nTween.onUpdateScope		=	p_obj.onUpdateScope;
				nTween.onCompleteScope		=	p_obj.onCompleteScope;
				//nTween.onOverwriteScope		=	p_obj.onOverwriteScope;
				//nTween.onErrorScope			=	p_obj.onErrorScope;
				//nTween.rounded				=	p_obj.rounded;
				//nTween.skipUpdates			=	p_obj.skipUpdates;

				// Remove other tweenings that occur at the same time
				//if (p_obj.overwrite == undefined ? autoOverwrite : p_obj.overwrite) removeTweensByTime(nTween.scope, nTween.properties, nTween.timeStart, nTween.timeComplete); // Changed on 1.32.74
	
				// And finally adds it to the list
				_tweenList.push(nTween);
	
				// Immediate update and removal if it's an immediate tween -- if not deleted, it executes at the end of this frame execution
				if (rTime == 0 && rDelay == 0) {
					myT = _tweenList.length - 1;
					updateTweenByIndex(myT);
					removeTweenByIndex(myT);
				}
			}
			return true;
		}
		
		public static function removeTweens(p_scope:Object):Boolean {
			return affectTweens(removeTweenByIndex, p_scope, []);
		}
		
		private static function affectTweens (p_affectFunction:Function, p_scope:Object, p_properties:Array):Boolean {
			var affected:Boolean = false;
			var i:uint;

			if (!Boolean(_tweenList)) return false;

			for (i = 0; i < _tweenList.length; i++) {
				if (_tweenList[i] && _tweenList[i].scope == p_scope) {
					p_affectFunction(i);
					affected = true;
				}
			}
			return affected;
		}
		
		public static function init():void {
			_inited = true;
			_transitionList = new Object();
			KEquations.init();
			
			startEngine();
		}
		
		private static function startEngine():void {
			_engineExists = true;
			_tweenList = new Array();
			
			//_currentTimeFrame = 0;
			//updateTime();
		}
		
		public static function update():void {
			//updateTime();
			//updateFrame();
			var hasUpdated:Boolean = false;
			hasUpdated = updateTweens();
			//if (!hasUpdated) stopEngine();	// There's no tweening to update or wait, so it's better to stop the engine
		}
		
		private static function updateFrame():void {
			_currentTimeFrame++;
		}
		
		private static function updateTweens():Boolean {
			if (_tweenList.length == 0) return false;
			var i:int;
			for (i = 0; i < _tweenList.length; i++) {
				// Looping throught each Tweening and updating the values accordingly
				if (_tweenList[i] == undefined || !_tweenList[i].isPaused) {
					if (!updateTweenByIndex(i)) removeTweenByIndex(i);
					if (_tweenList[i] == null) {
						removeTweenByIndex(i, true);
						i--;
					}
				}
			}
			return true;
		}
		
		static private function removeTweenByIndex(i:int, p_finalRemoval:Boolean = false):Boolean {
			_tweenList[i] = null;
			if (p_finalRemoval) _tweenList.splice(i, 1);
			return true;
		}
		
		static private function updateTweenByIndex(i:int):Boolean {
			var tTweening:KTweenObj = _tweenList[i];
			if (tTweening == null || !Boolean(tTweening.scope)) return false;
			
			var isOver:Boolean = false;		// Whether or not it's over the update time
			
			var tScope:Object = tTweening.scope;
			
			var nv:Number;					// New value for each property
			var t:Number;					// current time (frames, seconds)
			var b:Number;					// beginning value
			var c:Number;					// change in value
			var d:Number; 					// duration (frames, seconds)
			//var cTime:Number = getCurrentTweeningTime(tTweening);
			var cTime:Number = K._time;
			
			var pName:String;
			var eventScope:Object;			// Event scope, used to call functions
			var tProperty:Object;			// Property being checked
			
			var pv:Number;
			for (pName in tTweening.properties) {// Directly read property
				pv = tScope[pName];
				tTweening.properties[pName].valueStart = isNaN(pv) ? tTweening.properties[pName].valueComplete : pv;
			}
			
			if (cTime >= tTweening.timeComplete) {
				isOver = true;
			}
			
			for (pName in tTweening.properties) {
				tProperty = tTweening.properties[pName];
				if (isOver) {// Tweening time has finished, just set it to the final value
					nv = tProperty.valueComplete;
				} else {
					t = cTime - tTweening.timeStart;
					b = tProperty.valueStart;
					c = tProperty.valueComplete - tProperty.valueStart;
					d = tTweening.timeComplete - tTweening.timeStart;
					nv = tTweening.transition(t, b, c, d, tTweening.transitionParams);
				}
				tScope[pName] = nv;
			}
			
			if (isOver && Boolean(tTweening.onComplete)) {
				eventScope = Boolean(tTweening.onCompleteScope) ? tTweening.onCompleteScope : tScope;
				try {
					tTweening.onComplete.apply(eventScope, tTweening.onCompleteParams);
				} catch(e4:Error) {
					//handleError(tTweening, e4, "onComplete");
				}
			}
			
			return (!isOver);
		}
		
		public static function registerTransition(p_name:String, p_function:Function): void {
			_transitionList[p_name] = p_function;
		}
		
		//private static function updateTime():void {
			//_currentTime = getTimer();
		//}
		
		//public static function getCurrentTweeningTime(p_tweening:Object):Number {
			//return p_tweening.useFrames ? _currentTimeFrame : _currentTime;
		//}
		
		//private static function handleError(pTweening : KTweenObj, pError : Error, pCallBackName : String) : void{
            // do we have an error handler?
            //if (Boolean(pTweening.onError) && (pTweening.onError is Function)){
                // yup, there's a handler. Wrap this in a try catch in case the onError throws an error itself.
				//var eventScope:Object = Boolean(pTweening.onErrorScope) ? pTweening.onErrorScope : pTweening.scope;
                //try {
                    //pTweening.onError.apply(eventScope, [pTweening.scope, pError]);
                //} catch (metaError : Error){
					//printError(String(pTweening.scope) + " raised an error while executing the 'onError' handler. Original error:\n " + pError.getStackTrace() +  "\nonError error: " + metaError.getStackTrace());
                //}
            //} else {
                // no handler, simply trace the stack trace:
                //if (!Boolean(pTweening.onError)){
					//printError(String(pTweening.scope) + " raised an error while executing the '" + pCallBackName + "'handler. \n" + pError.getStackTrace() );
                //}
            //}
        //}
	}
}