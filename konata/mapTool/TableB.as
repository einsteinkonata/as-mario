package konata.mapTool 
{
	import KO.KRectangleEntity;
	import konata.G;
	 
	/**
	 * ...
	 * @author 计算用
	 */
	public class TableB extends KRectangleEntity 
	{
		public var sdx:int = 0;
		public var sdy:int = 0;
		public var edx:int = 0;
		public var edy:int = 0;
		
		
		public function TableB(sdx:int, sdy:int, edx:int, edy:int
		, width:int = 0, height:int = 0,moveType:int = 0,speed:Number = 1)
		{
			super(sdx * G.Size, sdy * G.Size, width * G.Size, height * G.Size);
			this.sdx = sdx;
			this.sdy = sdy;
			this.edx = edx;
			this.edy = edy;
		}
		
	}

}