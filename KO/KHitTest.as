package KO {
	
	public class KHitTest{
		
		
		public static function testOBBvsOBB(ra:KRectangleEntity, rb:KRectangleEntity):void {
			ra.y += ra.vy;
			if (ra.vy != 0 && KHit.RectHitRect(ra, rb) == true) {
				ra.vy = 0;
			}else {// 非擦边
				ra.y -= ra.vy;
			}
			
			ra.x += ra.vx;
			if (ra.vx != 0 && KHit.RectHitRect(ra, rb) == true) {
				ra.vx = 0;
			}else {
				ra.x -= ra.vx;
			}
		}
		
		public static function testCirclevsCircle(ca:KCircleEntity, cb:KCircleEntity):void {
			ca.y += ca.vy;
			if (ca.vy != 0 && KHit.CircleHitCircle(ca, cb) == true) {
				ca.vy = 0;
			}else {// 非擦边
				ca.y -= ca.vy;
			}
			
			ca.x += ca.vx;
			if (ca.vx != 0 && KHit.CircleHitCircle(ca, cb) == true) {
				ca.vx = 0;
			}else {
				ca.x -= ca.vx;
			}
		}
		
		public static function testOBBvsCircle(ra:KRectangleEntity, ca:KCircleEntity):void {
			ra.x += ra.vx;
			if (KHit.RectHitCircle(ra, ca)) {
				ra.vx = 0
			}else {
				ra.x -= ra.vx;
			}
			
			ra.y += ra.vy;
			if (KHit.RectHitCircle(ra, ca)) {
				ra.vy = 0;
			}else{
				ra.y -= ra.vy;
			}
		}
		
		public static function testCirclevsOBB(ca:KCircleEntity, ra:KRectangleEntity):void {
			ca.x += ca.vx;
			if (KHit.RectHitCircle(ra, ca)) {
				ca.vx = 0
			}else {
				ca.x -= ca.vx;
			}
			
			ca.y += ca.vy;
			if (KHit.RectHitCircle(ra, ca)) {
				ca.vy = 0;
			}else{
				ca.y -= ca.vy;
			}
		}
	}

}