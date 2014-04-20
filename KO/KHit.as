package KO {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import KO.KEntity;
	
	public class KHit {
		
		public function KHit() {
			
		}
		
		public static function RectHitPoint(obj:KRectangleEntity, p:Point):Boolean {
			return (p.x > obj.x && p.x < obj.x + obj.width
			&& p.y > obj.y && p.y < obj.y + obj.height);
		}
		
		public static function RectHitXY(obj:Rectangle, x:Number,y:Number):Boolean {
			return (x > obj.x && x < obj.x + obj.width
			&& y > obj.y && y < obj.y + obj.height);
		}
		
		public static function CircleHitPoint(obj:KCircleEntity, p:Point):Boolean {
			var dx:Number = p.x - obj.x;
			var dy:Number = p.y - obj.y;
			var r:Number = obj.radius;
			return (Math.abs(dx) < r && Math.abs(dy) < r)
		}
		
		public static function HitHorizontal(char:KRectangleEntity, obj:KRectangleEntity):Boolean {
			return (char.y + char.height > obj.y
			&& char.y < obj.y + obj.height
			&& char.vx + char.x < obj.x + obj.width
			&& char.vx + char.x + char.width > obj.x);
		}
		
		public static function HitVertical(char:KRectangleEntity, obj:KRectangleEntity):Boolean {
			return (char.x + char.width > obj.x
			&& char.x < obj.x + obj.width
			&& char.vy + char.y < obj.y + obj.height
			&& char.vy + char.y + char.height > obj.y);
		}
		
		public static function RectHitRect(ra:KRectangleEntity, rb:KRectangleEntity):Boolean {
			return ((ra.x + ra.width > rb.x) && (ra.x < rb.x + rb.width) &&
				(ra.y + ra.height > rb.y) && (ra.y < rb.y + rb.height));
		}
		
		public static function CircleHitCircle(ca:KCircleEntity, cb:KCircleEntity):Boolean {
			var dx:Number = ca.x - cb.x;
			var dy:Number = ca.y - cb.y;
			return (Math.sqrt(dx * dx + dy * dy) <= ca.radius + cb.radius);
		}
		
		public static function RectHitCircle(ra:KRectangleEntity, ca:KCircleEntity):Boolean {
			var rx:Number = ca.x - (ra.x + ra.halfWidth);
			var ry:Number = ca.y - (ra.y + ra.halfHeight);
			
			var dx:Number = Math.min(rx, ra.halfWidth);
			dx = Math.max(dx, -ra.halfWidth);
			var dy:Number = Math.min(ry, ra.halfHeight);
			dy = Math.max(dy, -ra.halfHeight);
			rx = rx - dx;
			ry = ry - dy;
			return rx * rx + ry * ry < ca.radius * ca.radius;
		}
		
		public static function clampHorizontal(char:KEntity, obj:KEntity):void
        {
			var value:Number;
			if (char.vx > 0) {
				value = obj.x - (char.x + char.bitmapW);
				char.vx = value;
			}
			else if (char.vx < 0) {
				value = obj.x + obj.bitmapW - char.x;
				char.vx = value;
			}
        }
		
        public static function clampVertical(char:KEntity, obj:KEntity):void
        {
			var value:Number;
            if (char.vy > 0) {
				value = obj.y - (char.y + char.bitmapH);
				char.vy = value;
			}
			else if (char.vy < 0) {
				value = obj.y + obj.bitmapH - char.y;
				char.vy = value;
			}
        }
		
		//public function clampHorizontal(param1:Number, param2:Number, param3:Number = 0) : void
        //{
            //if (this.x - this.originX < param1 + param3)
            //{
                //this.x = param1 + this.originX + param3;
            //}
            //if (this.x - this.originX + this.width > param2 - param3)
            //{
                //this.x = param2 - this.width + this.originX - param3;
            //}
            //return;
        //}
		
        //public function clampVertical(param1:Number, param2:Number, param3:Number = 0) : void
        //{
            //if (this.y - this.originY < param1 + param3)
            //{
                //this.y = param1 + this.originY + param3;
            //}
            //if (this.y - this.originY + this.height > param2 - param3)
            //{
                //this.y = param2 - this.height + this.originY - param3;
            //}
            //return;
        //}
	}
}