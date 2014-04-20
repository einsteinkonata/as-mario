package KO {
	import flash.display.BitmapData;
	import flash.display.Shape;
	
	public class KRectangleEntity extends KEntity implements IHitTypes {
		
		private var _width:int;// 方碰撞体积	// 要分离
		private var _height:int;
		private var _halfWidth:Number;
		private var _halfHeight:Number;
		
		public function KRectangleEntity(x:Number, y:Number, width:Number, height:Number) {
			super(x, y);
			this.bitmapW = this.width = width;
			this.bitmapH = this.height = height;
			
		}
		
		public function vsOBB(obb:KRectangleEntity):void {
			this.y += this.vy;
			if (KHit.RectHitRect(this, obb) == true) {
				this.y -= this.vy;
				this.vy = 0;
			}else {// 非擦边
				this.y -= this.vy;
			}
			
			this.x += this.vx;
			if (KHit.RectHitRect(this, obb) == true) {
				this.x -= this.vx;
				this.vx = 0;
			}else {
				this.x -= this.vx;
			}
		}
		
		public function vsCircle(circle:KCircleEntity):void {
			this.x += this.vx;
			if (KHit.RectHitCircle(this, circle)) {
				this.vx = 0;
			}else {
				this.x -= this.vx;
			}
			
			this.y += this.vy;
			if (KHit.RectHitCircle(this, circle)) {
				this.vy = 0;
			}else{
				this.y -= this.vy;
			}
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			this.renderData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			var sp:Shape = new Shape();
			sp.graphics.beginFill(dc, alpha);
			sp.graphics.drawRect(0, 0, this.bitmapW, this.bitmapH);
			sp.graphics.endFill();
			this.renderData.draw(sp);
		}
		
		public function get width():int {
			return _width;
		}
		public function set width(value:int):void {
			_width = value;
			_halfWidth = _width / 2;
		}
		public function get height():int {
			return _height;
		}
		public function set height(value:int):void {
			_height = value;
			_halfHeight = _height / 2;
		}
		
		public function get halfWidth():Number {
			return _halfWidth;
		}
		
		public function get halfHeight():Number {
			return _halfHeight;
		}
			
		//public function get angle():Number {
			//return radian * MathUtil.ONE_EIGHTY_OVER_PI;
		//}
//
		//public function set angle(a:Number):void {
			//radian = a * MathUtil.PI_OVER_ONE_EIGHTY;
		//}
			
		//public override function init():void {
//			cleanup();
//			if (displayObject != null) {
//				initDisplay();
//			} else {
//			
//				var w:Number = extents[0] * 2;
//				var h:Number = extents[1] * 2;
//				
//				sprite.graphics.clear();
//				sprite.graphics.lineStyle(lineThickness, lineColor, lineAlpha);
//				sprite.graphics.beginFill(fillColor, fillAlpha);
//				sprite.graphics.drawRect(-w/2, -h/2, w, h);
//				sprite.graphics.endFill();
//			}
//			paint();
//		}
		
		//public override function paint():void {
//			sprite.x = curr.x;
//			sprite.y = curr.y;
//			sprite.rotation = angle;
//		}
		
		//public function set width(w:Number):void {
//			_extents[0] = w/2;
//		}
//
//		public function get width():Number {
//			return _extents[0] * 2
//		}
//
//		public function set height(h:Number):void {
//			_extents[1] = h / 2;
//		}
//
//		public function get height():Number {
//			return _extents[1] * 2
//		}
//		
//		internal function get axes():Array {
//			return _axes;
//		}
//		
//		internal function get extents():Array {
//			return _extents;
//		}
//		
//		internal function getProjection(axis:Vector):Interval {
//			// extents 程度
//			var radius:Number =
//			    extents[0] * Math.abs(axis.dot(axes[0])) +
//			    extents[1] * Math.abs(axis.dot(axes[1]));// 半长 * cos角度宽  半宽 * sin角度长
//			
//			var c:Number = samp.dot(axis);// x y 乘　传入角度
//			
//			interval.min = c - radius;
//			interval.max = c + radius;
//			return interval;
//		}
//		
//		private function setAxes(t:Number):void {
//			var s:Number = Math.sin(t);// y
//			var c:Number = Math.cos(t);// x
//			
//			axes[0].x = c; // x
//			axes[0].y = s; // y
//			axes[1].x = -s;// -y
//			axes[1].y = c; // x
//		}
	}
}