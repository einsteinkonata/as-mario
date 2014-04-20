package KO {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Point;
	
	public class KCircleEntity extends KEntity implements IHitTypes {
		private const parame1:Number = 0.0001;
		private var _radius:Number;
		private var _diameter:Number;
		
		public function KCircleEntity(x:Number, y:Number, radius:Number) {
			super(x, y);
			
			this.radius = radius;
			
			this.hitLayers = [];
			this.my = this.mx -= _radius;
		}
		
		public function get radius():Number {
			return _radius;
		}
		public function set radius(value:Number):void {
			_radius = value;
			_diameter = value * 2;
		}
		public function get diameter():Number {
			return _diameter;
		}
		
		public function vsOBB(rect:KRectangleEntity):void {
			var boolx:Boolean = false, booly:Boolean = false;
			this.x -= vx;
			if (this.vy != 0 && KHit.RectHitCircle(rect, this) == true) {
				if (this.x >= rect.x && this.x <= rect.x + rect.width) {
					this.y = (this.vy > 0)
						? rect.y - this.radius - parame1
						: rect.y + rect.height + this.radius + parame1;
				} else {
					booly = true;
					this.y -= this.vy;
				}
			}
			this.x += vx;
			
			this.y -= vy;
			if (this.vx != 0 && KHit.RectHitCircle(rect, this) == true) {
				if (this.y >= rect.y && this.y <= rect.y + rect.height) {
					this.x = (this.vx > 0)
					? rect.x - this.radius - parame1
					: rect.x + rect.width + this.radius + parame1;
				} else {
					boolx = true;
					this.x -= this.vx;
				}
			}
			this.y += vy;
		}
		
		public function vsCircle(circle:KCircleEntity):void {
			if (KHit.CircleHitCircle(this, circle) == true) {
				var dx:Number = this.x - circle.x
				,dy:Number = this.y - circle.y
				,w2:Number = this.radius + circle.radius;
				
				var angle1:Number = Math.atan2(dy, dx);
				var angle2:Number = Math.atan2(this.vy, this.vx);
				
				this.x = circle.x + Math.cos(angle1) * w2;
				this.y = circle.y + Math.sin(angle1) * w2;
				
				angle2 += (angle1 > angle2) ? -0.01 : 0.01;
				vx = Math.cos(angle2) * speed;
				vy = Math.sin(angle2) * speed;
			}
		}
		
		override public function containsMouse():Boolean 
		{
			return (this.matrix.tx <= KInput.mouseX && this.matrix.ty <= KInput.mouseY
			&& this.radius + this.matrix.tx > KInput.mouseX
			&& this.radius + this.matrix.ty > KInput.mouseY);
		}
		
		override public function draw(dc:int = 0x00ff00, alpha:Number = 1):void 
		{
			this.renderData = new BitmapData(diameter, diameter, true, 0);
			var sp:Shape = new Shape();
			sp.graphics.beginFill(dc,alpha);
			sp.graphics.drawEllipse(0, 0, diameter, diameter);
			sp.graphics.endFill();
			this.renderData.draw(sp);
		}
		
		//	画
		//public override function paint():void {
			//sprite.x = curr.x;
			//sprite.y = curr.y;	
		//}
		//	获得投影
		//internal function getProjection(axis:Vector):Interval {
			//var c:Number = samp.dot(axis);
			//interval.min = c - _radius;
			//interval.max = c + _radius;
			//
			//return interval;
		//}
		//	间隔X
		//internal function getIntervalX():Interval {
			//interval.min = curr.x - _radius;
			//interval.max = curr.x + _radius;
			//return interval;
		//}
		//	间隔Y
		//internal function getIntervalY():Interval {
			//interval.min = curr.y - _radius;
			//interval.max = curr.y + _radius;
			//return interval;
		//}
	}
}