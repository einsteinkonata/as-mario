package konata.pig  
{
	import flash.geom.Matrix;
	import KO.KAnimMap;
	import KO.KRectangleEntity;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.PigMoveHelper;
	
	public class PigE extends PigBase 
	{
		//private var state:int = 0;
		
		public function PigE(_x:int,_y:int, param:Array)
		{
			super(_x, _y, G.Size, G.Size - 6);
			
			this.speed = param != null && param.length > 0 ? param[0] : 7;
			type = "0";
			
			_animMap = new KAnimMap();
			//_animMap.add("move", [408, 418, 428, 438, 448, 458], 0.1);
			//_animMap.add("move", [1400, 1410, 1420, 1430], 0.1);
			//_animMap.add("move", [1401, 1411,1421, 1431], 0.1);
			//_animMap.add("move", [1402, 1412, 1422, 1432, 1442, 1452], 0.1);
			_animMap.add("move", [1403, 1413, 1423, 1433, 1443, 1453], 0.1);
			_animMap.play("move");
			
			this.my = -16;
		}
		
		override public function update():void
		{
			PigMoveHelper.OnMoveX(this);
			
			var mo:Boolean = true;
			if (this.vx > 0) {
				mo = true;
			}else if (this.vx < 0) {
				mo = false;
			}else {
				mo = (CGame.player != null && this.x < CGame.player.x);
			}
			
			
			if (mo == true) {
				this.matrix.a = -1;
				this.mx = 64 - 16;
			}else{
				this.matrix.a = 1;
				this.mx = 0;
				this.mx += -16;
			}
			
			_animMap.update();
		}
		override public function render():void 
		{
			//draw(0xff0000);
			//this.renderData.draw(_animMap._source, this.);
			this.renderData = _animMap._source;
		}
	}
}

















