package konata.mapItem
{
	import KO.K;
	import KO.KEmitter;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	
	public class PlayerItemA extends KRectangleEntity
	{
		private var emitter:KEmitter;
		private var emi:int = 0;
		//
		private var timeNum:Number = 0;
		private var timeMax:Number = 3;
		
		public function PlayerItemA(_x:Number, _y:Number)
		{
			super(_x, _y, 16, 16);
			
			this.renderData = KSources.getBitmap(4, 7, 1);
			
			emitter = new KEmitter(KSources.getBitmap(4, 7, 1), 32, 32);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", 0.4, 0);
		}
		private function OnEmitter():void {
			if (emi++ % 6 == 0) {
				emitter.setMotion("a", -90, 20, .6, 0, 0);
				emitter.emit("a", this.x, this.y);
			}
			emitter.update();
		}
		
		override public function update():void { 
			timeNum += K.elapsed;
			if (timeNum >= timeMax) {
				K.game.remove(this);
			}
			
			OnEmitter();
		}
		override public function render():void {
			emitter.render();
		}
	}
}













