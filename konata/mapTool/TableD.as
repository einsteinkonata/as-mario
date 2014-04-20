package konata.mapTool 
{
	import konata.config.CGame;
	import konata.G;
	
	public class TableD extends BrickBase 
	{
		public function TableD(_x:int,_y:int) 
		{
			super(_x * G.Size, _y * G.Size, G.Size, G.Size);
			this._x = _x;
			this._y = _y;
		}
		
		override public function update():void  
		{
			if (CGame.pig4 < 4) {
				CGame.map[_x][_y] = [2, 4];
			}else {
				CGame.map[_x][_y] = [0, 0];
			}
		}
	}
}