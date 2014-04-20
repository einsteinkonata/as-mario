package KO {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;

	public class KEntity extends Object {
		public var _animMap:KAnimMap;
		
		public var activat:Boolean = true;
		public var visible:Boolean = true;
		
		public var _x:int;// 坐标
		public var _y:int;
		public var _w:int;// 方块大小
		public var _h:int;
		
		public var speed:Number = 0;
		public var x:Number = 0;	// 位置
		public var y:Number = 0;
		public var vx:Number = 0;	// 速度
		public var vy:Number = 0;
		
		public var originX:Number;// 中心点 // 起源,源点
		public var originY:Number;
		//private var _camera:Point;
		public var bitmapW:Number;// 图片长宽
		public var bitmapH:Number;
		//
		public var hitLayers:Array;	// 碰撞图层
		//
		public var renderData:BitmapData;	// 位图数据
		//
		private var _matrix:Matrix; //	矩阵渲染
		public var mx:Number = 0;	//	渲染位置
		public var my:Number = 0;
		private var _colorTransform:ColorTransform;
		//
		public var _world:KGame;
		public var name:String = "";
		public var type:String = "";
		public var _layer:String = "";
		
		public function KEntity(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
			this._matrix = new Matrix(1, 0, 0, 1, x, y);
			this._colorTransform = new ColorTransform();
		}
		
		public function moved():void {
			this.x += this.vx;
			this.y += this.vy;
			this.vx = this.vy = 0;
		}

		public function added():void {
			return;
		}

		public function removed():void {
			return;
		}

		public function update():void {
			return;
		}
		
		public function render():void {
			return;
		}
		
		public function containsMouse():Boolean {
			return (this.x <= KInput.mouseX && this.y <= KInput.mouseY
			&& this.bitmapW + this.x > KInput.mouseX
			&& this.bitmapH + this.y > KInput.mouseY);
		}
		
		public function draw(dc:int = 0x00ff00, alpha:Number = 1):void {
			this.renderData = new BitmapData(this.bitmapW, this.bitmapH, true, 0);
			var sp:Shape = new Shape();
			sp.graphics.beginFill(dc, alpha);
			sp.graphics.drawRect(0, 0, this.bitmapW, this.bitmapH);
			sp.graphics.endFill();
			this.renderData.draw(sp);
		}
		
		public function get CenterW():Number {
			return this.x;
		}
		
		public function get CenterH():Number {
			return this.y;
		}

		//public function get halfWidth():Number {
			//return this.imgW / 2;
		//}
		//public function get halfHeight():Number {
			//return this.imgH / 2;
		//}
		
		public function get matrix():Matrix {
			return _matrix;
		}
		public function set matrix(value:Matrix) {
			return _matrix = value;
		}
		
		public function get colorTransform():ColorTransform {
			return _colorTransform;
		}
		/**		 * 属性堆		 */
		public function set alpha(value:Number):void {
			_colorTransform.alphaMultiplier = value;
		}
		public function get alpha():Number {
			return _colorTransform.alphaMultiplier;
		}
		public function set scaleX(value:Number):void {
			_matrix.a = value;
		}
		public function get scaleX():Number {
			return _matrix.a;
		}
		public function set scaleY(value:Number):void {
			_matrix.d = value;
		}
		public function get scaleY():Number {
			return _matrix.d;
		}
		public function get Width():Number {
			return this.renderData.width;
		}
		public function get Height():Number {
			return this.renderData.height;
		}
	}
}