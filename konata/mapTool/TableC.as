package konata.mapTool 
{
	import KO.K;
	import KO.KSources;
	import konata.G;
	
	public class TableC extends BrickBase 
	{
		public var state:int = 0;
		private var time:Number = 0;
		private var timeMax:Number = 2;
		
		
		public function TableC(_x:int,_y:int) 
		{
			super(_x * G.Size, _y * G.Size, G.Size, G.Size);
			
			this.renderData = KSources.getBitmap(4, 6, 3);
		}
		
		override public function update():void  
		{
			if (state == 1) {
				time += K.elapsed;
				this.renderData = null;
				if (time >= timeMax) {
					time = 0;
					state = 0;
					this.renderData = KSources.getBitmap(4, 6, 3);
				}
			}
		}
	}
}