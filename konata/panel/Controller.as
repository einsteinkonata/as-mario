package konata.panel 
{
	import KO.KEntity;
	import KO.Key;
	import KO.KInput;
	import konata.config.CController;
	import konata.config.CGame;
	
	public class Controller extends KEntity
	{
		public function Controller()
		{
			
		}
		
		override public function update():void 
		{
			// 系统控制
			//if (CController.isAI == true) {
				//CController.reset();
				//return;
			//}
			if (KInput.checkKey(Key.A) == true) {
				CController.move = -1;
			}
			if (KInput.checkKey(Key.D) == true) {
				CController.move = 1;
			}
			if (KInput.checkKey(Key.D) == false && KInput.checkKey(Key.A) == false) {
				CController.move = 0;
			}
			//
			CController.jump = (KInput.checkKey(Key.K) == true) ? 1 : 0;
			CController.actk = (KInput.checkKey(Key.J) == true) ? 1 : 0;
		}
	}
}