package konata.mapItem 
{
	import KO.K;
	import KO.KEntity;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.G;
	import konata.Helper.ArmHelper;
	
	
	public class PlayerItemCA extends ItemSolid 
	{
		private var time:Number = 0;
		private var timeMax:Number = 4;
		
		public function PlayerItemCA(x:Number,y:Number)
		{
			super(x, y, G.Size - 2, G.Size - 2);
			
			this.renderData = KSources.getBitmap(4, 0, 9);
		}
		
		override public function update():void  
		{
			time += K.elapsed;
			if (time >= timeMax) {
				K.game.remove(this);
			}
		}
		
		override public function removed():void 
		{
			ArmHelper.newArmA(this.x, this.y);
		}
	}
}