package konata.arms 
{
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	
	import KO.KEntity;
	
	public class armD extends KEntity 
	{
		
		public function armD(x:Number,y:Number) 
		{
			super(x, y);
			
			_animMap = new KAnimMap();
			_animMap.add("play", [105, 115, 125, 135, 145], 0.07);
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