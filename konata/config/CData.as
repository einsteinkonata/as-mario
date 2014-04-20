package konata.config 
{
	
	
	public class CData 
	{
		
		public static var playerState:int = 0;
		public static var DataPoint:int = 0;
		public static var DataLevel:Array = [];
		
		public static function Create():void {
			test();
		}
		
		private static function test():void
		{
			DataLevel = new Array();
			DataLevel.push(new Array());
			DataLevel.push(new Array());
			DataLevel.push(new Array());
			DataLevel.push(new Array());
			for (var i:int = 0; i < 6; i++) {
				var num1:int = 1;
				(DataLevel[0] as Array).push(num1);
				(DataLevel[1] as Array).push(num1);
				(DataLevel[2] as Array).push(num1);
				(DataLevel[3] as Array).push(num1);
			}
			//trace(DataLevel);
		}
	}
}