package konata.mapItem 
{
	import KO.K;
	import KO.KEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.Game;
	
	/**
	 * ...
	 * @author 计算用
	 */
	public class GoalItem extends KEntity 
	{
		private var array:Array = 
		[[ 0, 0]];
		//[[0, -2],[1, -2],[2, -2],[2, -1],[2, 0],[2, 1]
			//,[2, 2],[1, 2],[0, 2],[ -1, 2],[ -2, 2]
			//,[ -2, 1], [ -2, -0], [ -2, -1], [ -2, -2], [ -1, -2]];
		//
		private var time:Number = 0;
		private var timeMax:Number = 0.1;
		
		public function GoalItem(_x:Number, _y:Number)
		{
			this.x = _x;
			this.y = _y;
		}
		
		override public function update():void  
		{
			time += K.elapsed;
			if (time >= 1) {
				trace("gane over!");
				K.game.remove(this);
				Game.T.InGameOver();
			}
		}
	}
}

			//
			//
			//
			//[-2, -2][-1, -2][0, -2][1, -2][2, -2]
			//[-2, -1][2, -1]
			//[-2, -0][2, 0]
			//[-2, 1][2, 1]
			//[-2, 2][-1, 2][0, 2][1, 2][2, 2]