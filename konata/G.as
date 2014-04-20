package konata 
{
	import KO.K;
	/**
	 * ...
	 * @author 计算用
	 */
	public class G  
	{
		static public const LayerBackground1:String = "LayerBackground1";
		static public const LayerPlayer:String = "LayerPlayer";
		static public const LayerPig:String = "LayerPig";
		static public const LayerMap:String = "LayerMap";
		static public const LayerItem:String = "LayerItem";
		
		static public const Size:int = 32;
		// 初始地图空间
		static public var romX:int = 6 * Size;
		static public var romY:int = 6 * Size;
		static public var roomX:int = K.W + romX;
		static public var roomY:int = K.H + romY;
		
		static public var Gravity:Number = 1;
		
		public function G() 
		{
			
		}
	}
}