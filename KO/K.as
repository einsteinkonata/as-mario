package KO {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class K extends Object{
		static public const VERSION:String = "0.1";
		static public var W:uint;
		static public var H:uint;
		static public var FrameRate:Number;
		static public var BackColor:int;
		public static var elapsed:Number;// 这只是间隔
		public static var _timeFrame:int;
		
		public static var _time:int;
		
		public static var buffer:BitmapData;
		static public var size:uint = 32;		// 默认大小
		public static var Layer0:String = "first";
		public static var Layer1:String = "last";
		public static var LayerMain:String = "main";
		
		static public var engine:KEngine;		// 引擎
		static public var game:KGame;			// 处理器
		
		static public var stage:Bitmap;			// 舞台
		static public var render:BitmapData;	// 渲染器
		public static var Camera:Point = new Point();	// 摄像机
		
		public static var point:Point = new Point();        
		public static var zero:Point = new Point();
        public static var rect:Rectangle = new Rectangle();
        public static var matrix:Matrix = new Matrix();
        public static var sprite:Sprite = new Sprite();
        public static var entity:KEntity;
		
		public function K() {
			
		}
		
		public static function Fill():void {
			render.fillRect(rect, BackColor);
		}
		
		// Used for rad-to-deg and deg-to-rad conversion.
		/** @private */ public static const DEG:Number = -180 / Math.PI;
		/** @private */ public static const RAD:Number = Math.PI / -180;
		
		/** @private */ public static const MPI180:Number = Math.PI / 180;
		/** @private */ public static const M180PI:Number = 180 / Math.PI;
		
		public static function randomInt(value:uint = 0):uint {
			return Math.floor(Math.random() * (value + 0.99999));
		}
		
		public static function get random():Number
		{
			return Math.random();
			//var _seed:Number = (_timeFrame * 16807) % int.MAX_VALUE;
			//return _seed / int.MAX_VALUE;
		}
	}
}