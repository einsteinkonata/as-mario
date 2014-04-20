package KO 
{
	public class KEntityGroup extends KEntity 
	{
		public var kentityList:Array;
		
		public function KEntityGroup(x:Number,y:Number)
		{
			super(x, y);
		}
		
		override public function update():void 
		{
			mainUpdate();
			listUpdate();
		}
		public function mainUpdate():void {
			return;
		}
		public function listUpdate():void {
			for each(var e:KEntity in kentityList) {
				K.game.UpdateHelper(e);
			}
		}
		
		override public function render():void 
		{
			mainRender();
			listRender();
		}
		public function mainRender():void {
			return;
		}
		public function listRender():void {
			for each(var e:KEntity in kentityList) {
				K.game.RenderHelper(e);
			}
		}
	}
}