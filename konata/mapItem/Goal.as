package konata.mapItem 
{
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import konata.config.CController;
	import konata.config.CGame;
	import konata.G;
	
	public class Goal extends ItemBase
	{
		public function Goal(_x:int,_y:int)
		{
			super(_x, _y);
			this.renderData = KSources.getBitmap(4, 9, 9);
		}
	}
}








