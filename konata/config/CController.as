package konata.config 
{
	
	public class CController 
	{ 
		public static var isAI:Boolean = false;
		
		public static var move:int = 0;
		public static var jump:int = 0;
		public static var actk:int = 0;
		
		public static function reset():void {
			actk = jump = move = 0;
		}
	}

}