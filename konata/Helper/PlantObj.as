package konata.Helper  
{
	import KO.K;
	public class PlantObj 
	{
		public var x:int;
		public var y:int;
		public var s:int;// subject
		public var t:int;// type
		public var around:Array;
		// 在为草时是周围坐标
		// 在为树时是记录
		
		public function PlantObj(x:int, y:int, s:int, t:int
		,around:Array = null)
		{
			this.x = x;
			this.y = y;
			this.s = s;
			this.t = t;
			if (around != null) {
				this.around = around;
				return;
			}
			serAround(around);
		}
		
		private function serAround(around:Array):void {
			switch(this.t) {
				case 3:// 草，判断周边四格
					this.around = [[0, -1], [ -1, 0], [1, 0], [0, 1]];
					break;
				case 4:// 高度，枝干第几格开始，默认当前，(长时随机左右，只长一边)
					this.around = [K.randomInt(5) + 5, 0];
					break;
			}
		}
	}
}










