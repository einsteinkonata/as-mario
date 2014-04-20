package konata.particle  
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import KO.K;
	import KO.KAnimMap;
	import KO.KEntity;
	import KO.KSources;
	
	public class Box1 extends KEntity 
	{
		private var timeIndex:Number = 0;
		private var time:Number = 0.5;
		private var scale:Number = 1.5;
		
		public function Box1(_x:int,_y:int,bitmap:BitmapData = null)
		{
			bitmap = (bitmap == null) ? KSources.getBitmap(0, 1) : bitmap;
			super(_x * bitmap.width, _y * bitmap.height);
			this._x = _x;
			this._y = _y;
			
			_animMap = new KAnimMap();
			_animMap.add("play", [439, 449, 459], 0.07);
			_animMap.play("play", false);
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










