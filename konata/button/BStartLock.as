package konata.button  
{
	import KO.KEntity;
	import KO.KSources;
	
	public class BStartLock extends KEntity 
	{
		
		public function BStartLock(x:Number,y:Number) 
		{
			super(x, y);
			this.renderData = KSources.getBitmap(10, 2);
			this.mx = this.my = -8;
		}
		
	}

}