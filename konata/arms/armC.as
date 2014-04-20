package konata.arms  
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	
	import KO.KEntity;
	
	public class armC extends KEntity 
	{
		
		public function armC(x:Number,y:Number) 
		{
			super(x, y);
			
			_animMap = new KAnimMap();
			_animMap.add("play", [104, 114, 124, 134, 144], 0.07);
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