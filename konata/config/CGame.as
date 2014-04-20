package konata.config  
{
	import flash.display.BitmapData;
	import KO.K;
	import konata.G;
	import konata.level.LevelBase;
	import konata.level.LevelHelper;
	import konata.mono.Player;
	public class CGame
	{
		public static var IsAnim:Boolean = false;
		public static var anim4:int = 0;
		public static var anim6:int = 0;
		public static var pigD:Number = 0;
		public static var pigDMax:Number = 2.5;
		public static var pig4:Number = 0;
		public static var pig4Max:Number = 8;
		//
		public static var animCard:BitmapData;
		//
		public static var map:Array;
		static public var mapWidth:int;
		static public var mapHeight:int;
		static public var CW:int;
		static public var CH:int;
		
		public static var lvNum:String = "1-1";
		public static var lv:LevelBase;
		
		public static var player:Player;		
		// 分数
		public static var mainPoint:int = 0;
		public static var point:int = 0;
		public static var time:int = 0;
		
		public static function Create():void {
			lv = LevelHelper.getLevelMap();
			map = lv.grid;
			
			K.Camera.x = lv.cameraX;
			K.Camera.y = lv.cameraY;
			
			CW = lv.W * G.Size;
			CH = lv.H * G.Size;
			mapWidth = CW;
			mapHeight = CH < K.H ? K.H : CH;
			
			point = 0;
		}
	}
}












