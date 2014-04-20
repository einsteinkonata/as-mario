package konata.Helper  
{
	import KO.KGridHit;
	import konata.config.CGame;
	import konata.G;
	import konata.pig.PigBase;
	
	public class PigMoveHelper 
	{
		public static function moveA(p:PigBase):void {
			MoveStart(p);
			
			OnMoveA(p);
			
			MoveEnd(p);
			if (p.IsSink == 1) p.OnSink();
		}
		private static function OnMoveA(p:PigBase):void 
		{
			if (p.move == 1) {
				p.vx = p.speed;
				p.matrix.a = -1;
				p.mx = G.Size - 2;
			}
			else if (p.move == 2) {
				p.vx = -p.speed;
				p.matrix.a = 1;
				p.mx = -2;
			}
			//
			p.vy = p.vertical;
		}
		private static const reW:int = G.Size * 2.5;
		public static function moveB(p:PigBase):void {
			MoveStart(p);
			
			OnMoveB(p);
			
			MoveEnd(p);
			if (p.IsSink == 1) p.OnSink();
		}
		static private function OnMoveB(p:PigBase):void 
		{
			p.vx = p.move * p.speed;
			// 何时转向
			if(CGame.player != null){
				if (p.move == 1 && p.x - CGame.player.x > reW) {
					p.move = -1;
					p.matrix.a = 1;
					p.mx = -2;
				}
				else if (p.move == -1 && CGame.player.x - p.x > reW) {
					p.move = 1;
					p.matrix.a = -1;
					p.mx = G.Size - 2;
				}
			}
			//
			p.vy = p.vertical;
		}
		
		public static function OnMoveX(p:PigBase):void {
			if (CGame.player == null) return;
			
			if (p.type == "0") {
				var dist:int = CGame.player.y - p.y;
				var speedy:Number = p.speed / 2;
				if (dist > 0) {
					p.vy += speedy;
				}else if(dist < 0){
					p.vy = -speedy;
				}
				if (Math.abs(dist) < speedy) {
					p.y = CGame.player.y;
					p.vy = 0;
					
					p.type = (p.x > CGame.player.x)
						? "1" : "2";
				}
			}
			else if (p.type == "1") {
				if (p.x > CGame.player.x - 32 * 5) {
					p.vx = -p.speed;
				}else {
					p.type = "0";
				}
			}
			else if (p.type == "2") {
				if (p.x < CGame.player.x + 32 * 5) {
					p.vx = p.speed;
				}else {
					p.type = "0";
				}
			}
		}
		
		private static function MoveStart(p:PigBase):void {
			p.to_X();
			p.to_Y();			
			p.vertical += p.Quality * G.Gravity;//
		}
		private static function MoveEnd(p:PigBase):void {
			p.hitY = [];
			p.hitX = [];
			p.hitX = KGridHit.HitGridX(p, CGame.map);
			p.hitY = KGridHit.HitGridY(p, CGame.map);
			
			p.vertical = (p.hitY.length != 0) ? 0 : p.vertical;// 碰到就 0 下落重力
			
			if (p.hitX.length > 0) {
				p.move = (p.move == 1) ? 2 : 1;
			}
		}
	}
}






















