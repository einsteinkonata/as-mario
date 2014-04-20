package konata.level  
{
	import konata.config.CGame;
	import konata.level.LevelBase;
	import konata.level.Lv11;
	/**
	 * ...
	 * @author 计算用
	 */
	public class LevelHelper 
	{
		
		public static function getLevelMap():LevelBase {
			switch(CGame.lvNum) {
				case "1-1": return new Lv11();
				case "1-2": return new Lv12();
				case "1-3": return new Lv13();
				case "1-4": return new Lv14();
				case "1-5": return new Lv15();
				case "1-6": return new Lv16();
				
				case "2-1": return new Lv21();
				case "2-2": return new Lv22();
				case "2-3": return new Lv23();
				case "2-4": return new Lv24();
				case "2-5": return new Lv25();
				case "2-6": return new Lv26();
				
				case "3-1": return new Lv31();
				case "3-2": return new Lv32();
				case "3-3": return new Lv33();
				case "3-4": return new Lv34();
				case "3-5": return new Lv35();
				case "3-6": return new Lv36();
				
				case "4-1": return new Lv41();
				case "4-2": return new Lv42();
				case "4-3": return new Lv43();
				case "4-4": return new Lv44();
				case "4-5": return new Lv45();
				case "4-6": return new Lv46();			
			}
			return new Lv11();
		}
	}

}