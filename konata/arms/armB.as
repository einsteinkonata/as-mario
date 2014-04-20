package konata.arms 
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity; 
	
	public class armB extends KEntity 
	{
		
		public function armB(x:Number,y:Number) 
		{
			super(x, y);
			
			_animMap = new KAnimMap();
			_animMap.add("play", [103, 113, 123, 133, 143], 0.07);			
			_animMap.play("play", false);
			
			this.mx = this.my = -24;
		}
		override public function update():void 
		{
			if (_animMap.IsOver == true) {
				K.game.remove(this);
			}
			_animMap.update();
		}
		override public function render():void 
		{
			this.renderData = _animMap._source;
		}
	}
}