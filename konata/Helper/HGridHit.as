package konata.Helper  
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import KO.K;
	import KO.KEntity;
	import Konata.Config.CGrid;
	import Konata.G;
	public class HGridHit 
	{
		private var hitTop:Array = [[ -1, -1], [0, -1], [1, -1]];
		private var hitBottom:Array = [[ -1, 1], [0, 1], [1, 1]];
		private var hitLeft:Array = [[ -1, -1], [-1, 0], [-1, 1]];
		private var hitRight:Array = [[ 1, -1], [1, 0], [1, 1]];
		
		private var hitList:Array = [[ -1, -1], [0, -1], [1, -1]
									,[ -1, 0], [0, 0], [1, 0]
									,[ -1, 1], [0, 1], [1, 1]];
		
		
		public static function HitGridY(e:KEntity, g:Array):Boolean {
			var IsHit:Boolean = false;
			var obj:HGridObj = null;
			if (e.vy != 0) {
				var i:int;
				var dy:Number = e.y + e.vy;
				if (e.vy < 0) {
					var _dy:int= Math.floor(dy / K.size);
					if (_dy < 0) {
						e.vy = e._y * K.size - e.y;
					} else if (_dy == e._y - 1) {
						for (i = e._x; i <= e._w; i++) {
							obj = g[i][_dy];
							if (obj is HGridObj	&& obj.type == "1") {
								e.vy = e._y * K.size - e.y;
								dy = e.y + e.vy;
								e._y = Math.floor(dy / G.Size);
								e._h = Math.floor((dy + e.bitmapH) / G.Size);
								IsHit = true;
								break;
							}
						}
					}
				} else {
					var  _dy2:int = (dy + e.bitmapH) / K.size;
					if (_dy2 >= g[0].length) {
						e.vy = _dy2 * K.size - e.y - e.bitmapH - 1;
					} else if (_dy2 == e._h + 1) {
						for (i = e._x; i <= e._w; i++) {
							obj = g[i][_dy];
							if (obj is HGridObj	&& obj.type == "1")
							if (g[i][_dy2] == 1
							|| (g[i][_dy] == 2 && e.type == "")) {
								e.vy = _dy2 * K.size - e.y - e.bitmapH - 1;
								dy = e.y + e.vy;
								e._y = Math.floor(dy / G.Size);
								e._h = Math.floor((dy + e.bitmapH) / G.Size);
								IsHit = true;
								break;
							}
						}
					}
				}
			}
			return IsHit;
		}
		public static function HitGridX(e:KEntity, g:Array):Boolean {
			var IsHit:Boolean = false;
			if (e.vx != 0) {
				var i:int;
				var dx:Number = e.x + e.vx;
				if (e.vx < 0) {
					var _dx:int = Math.floor(dx / K.size);
					if (_dx < 0) {
						e.vx = e._x * K.size - e.x;
					} else if (_dx == e._x - 1) {
						for (i = e._y; i <= e._h; i++) {
							if (g[_dx][i] == 1) {
								e.vx = e._x * K.size - e.x;
								IsHit = true;
								break;
							}
						}
					}
				} else {
					var _dx2:int = (dx + e.bitmapW) / K.size;
					if (_dx2 >= g.length) {
						e.vx = _dx2 * K.size - e.x - e.bitmapW - 1;
					}else if (_dx2 == e._w + 1) {
						for (i = e._y; i <= e._h; i++) {
							if (g[_dx2][i] == 1) {
								e.vx = _dx2 * K.size - e.x - e.bitmapW - 1;
								IsHit = true;
								break;
							}
						}
					}
				}
			}
			return IsHit;
		}
		
		public static function HitGrid(e:KEntity,g:Array):void
		{
			HitGridX(e,g);
			HitGridY(e,g);
		}
	}

}