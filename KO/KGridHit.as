package KO
{
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import KO.K;
	import KO.KEntity;
	import konata.pig.PigFA;
	public class KGridHit
	{
		private var hitTop:Array = [[ -1, -1], [0, -1], [1, -1]];
		private var hitBottom:Array = [[ -1, 1], [0, 1], [1, 1]];
		private var hitLeft:Array = [[ -1, -1], [-1, 0], [-1, 1]];
		private var hitRight:Array = [[ 1, -1], [1, 0], [1, 1]];
		
		private var hitList:Array = [[ -1, -1], [0, -1], [1, -1]
									,[ -1, 0], [0, 0], [1, 0]
									,[ -1, 1], [0, 1], [1, 1]];
		
		public static function HitGridY(e:KEntity, g:Array):Array {
			var hitAry:Array = [];
			var param:int;
			if (e._x < -1 || e._w > g.length) return hitAry;
			
			if (e.vy != 0) {
				var i:int;
				var dy:Number = e.y + e.vy;
				var _dy:int= Math.floor(dy / K.size);
				if (e.vy < 0) {
					if (_dy == e._y - 1 && _dy >= 0) {
						for (i = e._x; i <= e._w; i++) {
							if (i >= 0 && i < g.length && _dy2 >= 0 && _dy2 < g[0].length)
							{
								param = g[i][_dy][0];
								if (param == 1 || param == 3) {
									hitAry.push([i, _dy, g[i][_dy][0], g[i][_dy][1]]);
									//
									e.vy = e._y * K.size - e.y;
									dy = e.y + e.vy;
									e._y = Math.floor(dy / K.size);
									e._h = Math.floor((dy + e.bitmapH) / K.size);
								}
							}
						}
					}
				} else {
					var  _dy2:int = Math.floor((dy + e.bitmapH) / K.size);
					if (_dy2 == e._h + 1) {
						for (i = e._x; i <= e._w; i++) {
							if (i >= 0 && i < g.length && _dy2 >= 0 && _dy2 < g[0].length) {
								param = g[i][_dy2][0];
								if (param == 1
								|| (param == 2 && e.type == "")
								||  param == 3) {
									hitAry.push([i, _dy2, g[i][_dy2][0], g[i][_dy2][1]]);
									//
									e.vy = (_dy2 * K.size - (e.bitmapH + 0.1)) - e.y;
									dy = e.y + e.vy;
									e._y = Math.floor(dy / K.size);
									e._h = Math.floor((dy + e.bitmapH) / K.size);
								}
							}
						}
					}
				}
			}
			return hitAry;
		}
		public static function HitGridX(e:KEntity, g:Array):Array {
			var hitAry:Array = [];
			var param:int;
			if (e._y < -1 || e._h > g[0].length) return hitAry;
			
			if (e.vx != 0) {
				var i:int;
				var dx:Number = e.x + e.vx;
				if (e.vx < 0) {
					var _dx:int = Math.floor(dx / K.size);
					
					if (_dx == e._x - 1 && _dx >= 0) {
						i = (e._y == -1) ? 0 : e._y;
						for (; i <= e._h; i++) {
							if (i >= 0 && i < g[0].length) {
								param = g[_dx][i][0];
								if (param == 1 || param == 3) {
									hitAry.push([_dx, i, g[_dx][i][0], g[_dx][i][1]]);
									e.vx = e._x * K.size - e.x;
									dx = e.x + e.vx;
									e._x = Math.floor(dx / K.size);
									e._w = Math.floor((dx + e.bitmapW) / K.size);
								}
							}
						}
					}
				} else {
					var _dx2:int = (dx + e.bitmapW) / K.size;
					if (_dx2 == e._w + 1 && _dx2 < g.length) {
						i = (e._y == -1) ? 0 : e._y;
						for (; i <= e._h; i++) {
							if (i >= 0 && i < g[0].length) { 
								param = g[_dx2][i][0];
								if (param == 1 || param == 3) {
									hitAry.push([_dx2, i, g[_dx2][i][0], g[_dx2][i][1]]);
									//
									e.vx = _dx2 * K.size - e.x - e.bitmapW - 1;
									dx = e.x + e.vx;
									e._x = Math.floor(dx / K.size);
									e._w = Math.floor((dx + e.bitmapW) / K.size);
								}
							}
						}
					}
				}
			}
			return hitAry;
		}
		
		public static function HitGrid(e:KEntity,g:Array):void
		{
			HitGridX(e,g);
			HitGridY(e,g);
		}
	}
}