package KO {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	import KO.K;

	public class KEngine extends MovieClip {
		public var paused:Boolean = false;
		public var maxElapsed:Number = 0.0333;
		
		private var _last:int;
		private var _rate:Number;

		public function KEngine(w:int,h:int,frameRate:Number = 30,color:int = 0) {
            K.W = w;
			K.H = h;
            K.FrameRate = frameRate;
			K.BackColor = color;
			K.rect = new Rectangle(0, 0, w, h);
			
            K.engine = this;
			K.game = new KGame();
            K.entity = new KEntity();
            K._time = getTimer();
			
			K.render = new BitmapData(w, h, true, color);
			K.stage = new Bitmap(K.render);
			
			addChild(K.stage);
			
			KTweener.init();
			
            addEventListener(Event.ADDED_TO_STAGE, onStage);
            return;
        }
		
		private function setStageProperties():void {
			stage.frameRate = K.FrameRate;
            stage.align = StageAlign.TOP_LEFT;
            stage.quality = StageQuality.HIGH;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.displayState = StageDisplayState.NORMAL;
		}
		
		private function onStage(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onStage);
			
            KInput.enable(stage);
			
            this._rate = 1000 / K.FrameRate;
			this._last = getTimer();
			K._timeFrame = 0;
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
            K._time = getTimer();
			
            K.elapsed = (K._time - _last) / 1000;
            
            if (K.elapsed > this.maxElapsed) {
                K.elapsed = this.maxElapsed;
            }
            
			
			
			if (!this.paused) {
				K.game.update();
			}
			
			KTweener.update();
			K.game.mainUpdate();
			K.game.render();
			KInput.update();
			
			this._last = K._time;
			K._timeFrame++;
		}
	}
}















